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

# 1) Carga jobs como JSON
JOBS_JSON="$($YQ eval -o=json '.jobs // {}' "$JOBS_FILE")"

# 2) Extrae todos los nombres de workflows presentes
WF_NAMES=($($YQ eval -o=json '
  .workflows | keys[]' "${WF_PATHS[@]}" 2>/dev/null | sed 's/"//g' | sort -u))

# 3) Para cada workflow, concatena sus .jobs en orden de archivos
TMP="$(mktemp)"
echo '{}' | $YQ eval '.' - > "$TMP"

for name in "${WF_NAMES[@]}"; do
  # Junta todas las listas de jobs bajo el mismo workflow
  JOBS_CONCAT="$($YQ eval -o=json ".workflows.\"$name\".jobs // []" "${WF_PATHS[@]}" \
    | jq -s 'flatten' 2>/dev/null || echo '[]')"

  # Inyecta ese workflow en el acumulador
  $YQ eval -i -o=json --arg name "$name" --argjson jobs "$JOBS_CONCAT" '
    .workflows[$name].jobs = $jobs
  ' "$TMP"
done

MERGED_WF="$($YQ eval -o=json '.' "$TMP")"
rm -f "$TMP"

# 4) Arma config final (para continuation: sin setup:true)
$YQ eval -n \
  --argjson JOBS "$JOBS_JSON" \
  --argjson WF   "$MERGED_WF" '
  .version = "2.1" |
  .setup = false |
  .jobs = $JOBS |
  .workflows = $WF.workflows
' > .circleci/config_final.yml

echo "✅ Combinación completada."
