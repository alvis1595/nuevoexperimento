#!/bin/bash
# Modo estricto + trazas
set -Eeuo pipefail
trap 'echo -e "\n💥 Falló en la línea $LINENO (cmd: $BASH_COMMAND)\n"' ERR
set -x

YQ="${YQ_PATH:-$HOME/bin/yq}"
echo "Using yq at: $YQ"
$YQ --version

JOBS_FILE=".circleci/jobs/${1}"
WF_CSV="${2}"

# --- Validaciones iniciales ---
[[ -f "$JOBS_FILE" ]] || { echo "❌ Archivo de jobs no encontrado: $JOBS_FILE"; exit 1; }
[[ -n "$WF_CSV" ]]    || { echo "❌ Lista CSV de workflows vacía"; exit 1; }

IFS=',' read -r -a WF_FILES <<< "$WF_CSV"
WF_PATHS=()
for f in "${WF_FILES[@]}"; do
  f_trim="$(echo "$f" | xargs)"
  wf_file=".circleci/workflows/${f_trim}"
  [[ -f "$wf_file" ]] || { echo "❌ Archivo de workflow no encontrado: $wf_file"; exit 1; }
  WF_PATHS+=("$wf_file")
done

echo "🛠 Combinando $JOBS_FILE + ${WF_PATHS[*]} en .circleci/config_final.yml"

# --- Validar sintaxis YAML de entrada ---
$YQ eval '.' "$JOBS_FILE" >/dev/null
for wf in "${WF_PATHS[@]}"; do
  $YQ eval '.' "$wf" >/dev/null
done

# --- Mostrar tipos para diagnóstico ---
echo "🔎 Tipos de nodos:"
echo "  jobs/config:      " "$($YQ eval '(.jobs | type)' "$JOBS_FILE" || true)"
for wf in "${WF_PATHS[@]}"; do
  echo "  workflows type ($wf): " "$($YQ eval '(.workflows | type)' "$wf" || true)"
done

# --- Cargar jobs como JSON ---
JOBS_JSON="$($YQ eval -o=json '.jobs // {}' "$JOBS_FILE")"

# --- Extraer y normalizar workflows (debe ser !!map) ---
TMP_LIST=()
for wf in "${WF_PATHS[@]}"; do
  tmp="$(mktemp)"
  # Si el archivo no tiene .workflows, producimos {}
  $YQ eval -o=json '.workflows // {}' "$wf" > "$tmp"
  echo "📄 $wf -> extraído .workflows a $tmp"
  echo "   keys: $($YQ eval -o=json 'keys' "$tmp" 2>/dev/null || echo '[]')"
  TMP_LIST+=("$tmp")
done

# --- Fusionar: misma key de workflow => concat de listas .jobs ---
# 1) recolectar nombres únicos de workflows
WF_NAMES=($($YQ eval -o=json 'keys[]' "${TMP_LIST[@]}" 2>/dev/null | sed 's/"//g' | sort -u || true))
echo "🧩 Workflows detectados: ${WF_NAMES[*]:-(ninguno)}"

# 2) construir objeto final con todas las jobs por workflow
ACC="$(mktemp)"
echo '{}' | $YQ eval '.' - > "$ACC"

for name in "${WF_NAMES[@]}"; do
  # Concatenar las listas .jobs de todos los archivos para este workflow
  # yq: recolecta jobs existentes; si falta, usa [].
  JOBS_MERGED="$($YQ eval -o=json \
    --arg NAME "$name" \
    '.[strenv(NAME)].jobs // []' \
    "${TMP_LIST[@]}" \
    2>/dev/null \
    | paste -sd'\n' - \
    | jq -s 'flatten' 2>/dev/null || echo '[]')"

  # Inyectar en acumulador
  $YQ eval -i -o=json --arg name "$name" --argjson jobs "$JOBS_MERGED" '
    .workflows[$name].jobs = $jobs
  ' "$ACC"
done

# --- Armar config final ---
$YQ eval -n \
  --argjson JOBS "$JOBS_JSON" \
  --argjson WF   "$($YQ eval -o=json '.' "$ACC")" '
  .version = "2.1" |
  .setup = false |
  .jobs = $JOBS |
  .workflows = $WF.workflows
' > .circleci/config_final.yml

echo "✅ Config final generada: .circleci/config_final.yml"
echo "---- HEAD .circleci/config_final.yml ----"
head -n 80 .circleci/config_final.yml || true
echo "-----------------------------------------"

# --- Validar salida ---
$YQ eval '.' .circleci/config_final.yml >/dev/null || { echo "❌ YAML final inválido"; exit 1; }
# (Opcional) si tienes CLI de CircleCI:
# circleci config validate -c .circleci/config_final.yml
