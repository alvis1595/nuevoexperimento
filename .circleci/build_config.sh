#!/bin/bash
set -euo pipefail

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
JOBS_JSON="$(yq -o=json '.jobs // {}' "$JOBS_FILE")"

# 2) Extraer solo 'workflows' de cada workflow file a temporales
TMP_LIST=()
for wf in "${WF_PATHS[@]}"; do
  tmp="$(mktemp)"
  # 👇 OJO: la expresión lleva llaves { } al inicio
  yq eval '{workflows: .workflows}' "$wf" > "$tmp"
  TMP_LIST+=("$tmp")
done

# 3) Fusionar workflows concatenando las listas 'jobs' cuando hay misma key
MERGED_WF="$(yq eval-all -o=json '
  def wfmerge($acc; $new):
    ($acc // {}) as $a | ($new // {}) as $n |
    ($a * $n) as $base |
    ($a | keys) as $ak |
    ($n | keys) as $nk |
    ($ak + $nk | unique) as $keys |
    reduce $keys[] as $k ($base;
      .[$k].jobs = (( $a[$k].jobs // [] ) + ( $n[$k].jobs // [] ))
    );

  reduce inputs as $d ({}; wfmerge(. ; $d.workflows))
' "${TMP_LIST[@]}")"

# 4) Armar config final
yq -n \
  --argjson JOBS "$JOBS_JSON" \
  --argjson WF   "$MERGED_WF" '
  .version = "2.1" |
  .setup = false |
  .jobs = $JOBS |
  .workflows = $WF
' > .circleci/config_final.yml

echo "✅ Combinación completada."

for t in "${TMP_LIST[@]}"; do rm -f "$t"; done
