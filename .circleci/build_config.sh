#!/bin/bash
set -euo pipefail

YQ="${YQ_PATH:-$HOME/bin/yq}"
echo "Using yq at: $YQ"
$YQ --version

JOBS_FILE=".circleci/jobs/${1}"
WF_CSV="${2}"

if [[ ! -f "$JOBS_FILE" ]]; then
  echo "❌ Archivo de jobs no encontrado: $JOBS_FILE"
  exit 1
fi

IFS=',' read -r -a WF_FILES <<< "$WF_CSV"
WF_PATHS=()
for f in "${WF_FILES[@]}"; do
  f_trim="$(echo "$f" | xargs)"
  wf_file=".circleci/workflows/${f_trim}"
  if [[ ! -f "$wf_file" ]]; then
    echo "❌ Archivo de workflow no encontrado: $wf_file"
    exit 1
  fi
  WF_PATHS+=("$wf_file")
done

echo "🛠 Combinando $JOBS_FILE + ${WF_PATHS[*]} en .circleci/config_final.yml"

# 1) Cargar jobs
JOBS_JSON="$($YQ -o=json '.jobs // {}' "$JOBS_FILE")"

# 2) Extraer y NORMALIZAR 'workflows' de cada archivo
#    - Si workflows es seq (lista), lo convertimos en map reduciendo ítems
TMP_LIST=()
for wf in "${WF_PATHS[@]}"; do
  tmp="$(mktemp)"
  $YQ -o=json '
    def norm_wf:
      if . == null then {}                      # sin workflows → {}
      elif type == "!!map" then .               # ya es mapa → OK
      elif type == "!!seq" then                 # lista → combinar en mapa
        reduce .[] as $i ({}; . * $i)
      else {} end;

    {"workflows": (.workflows | norm_wf)}
  ' "$wf" > "$tmp"
  TMP_LIST+=("$tmp")
done

# 3) Fusionar workflows concatenando listas 'jobs' por nombre de workflow
MERGED_WF="$($YQ eval-all -o=json '
  def wfmerge($acc; $new):
    ($acc // {}) as $a | ($new // {}) as $n |
    # base merge superficial (right-wins para metadatos no .jobs)
    ($a * $n) as $base |
    ($a.workflows // {}) as $aw |
    ($n.workflows // {}) as $nw |
    ($aw | keys) as $ak |
    ($nw | keys) as $nk |
    ($ak + $nk | unique) as $keys |
    reduce $keys[] as $k (
      {workflows: ($base.workflows // {} )};
      .workflows[$k].jobs =
        (( $aw[$k].jobs // [] ) + ( $nw[$k].jobs // [] ))
    );

  reduce inputs as $d ({}; wfmerge(. ; $d))
' "${TMP_LIST[@]}")"

# 4) Armar config final (para continuation: sin setup:true)
$YQ -n \
  --argjson JOBS "$JOBS_JSON" \
  --argjson WF   "$MERGED_WF" '
  .version = "2.1" |
  .setup = false |
  .jobs = $JOBS |
  .workflows = $WF.workflows
' > .circleci/config_final.yml

echo "✅ Combinación completada."

for t in "${TMP_LIST[@]}"; do rm -f "$t"; done
