#!/bin/bash
set -euo pipefail

YQ="${YQ_PATH:-$HOME/bin/yq}"   # usa el yq instalado en el job
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

# 1) Cargar jobs como JSON
JOBS_JSON="$($YQ -o=json '.jobs // {}' "$JOBS_FILE")"

# 2) Extraer 'workflows' de cada workflow a temporales (sin expresiones inline que confundan YAML)
TMP_LIST=()
for wf in "${WF_PATHS[@]}"; do
  tmp="$(mktemp)"
  # Extrae .workflows y luego lo envuelve como {"workflows": ...}
  $YQ -o=json '.workflows // {}' "$wf" | $YQ -o=json '{"workflows": .}' - > "$tmp"
  TMP_LIST+=("$tmp")
done

# 3) Fusionar workflows concatenando listas 'jobs' por key
MERGED_WF="$($YQ eval-all -o=json '
  def wfmerge($acc; $new):
    ($acc // {}) as $a | ($new // {}) as $n |
    # merge superficial base
    ($a * $n) as $base
    | ($a.workflows // {}) as $aw
    | ($n.workflows // {}) as $nw
    | ($aw | keys) as $ak
    | ($nw | keys) as $nk
    | ($ak + $nk | unique) as $keys
    | reduce $keys[] as $k (
        {workflows: $base.workflows};
        .workflows[$k].jobs = (( $aw[$k].jobs // [] ) + ( $nw[$k].jobs // [] ))
      );

  reduce inputs as $d ({}; wfmerge(. ; $d))
' "${TMP_LIST[@]}")"

# 4) Armar config final para continuation (sin setup:true)
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
