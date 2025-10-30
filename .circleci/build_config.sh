#!/bin/bash
# build_config.sh
# Combina 1 archivo de jobs (incluye jobs + executors)
# con N archivos de workflows (concatena listas de jobs por workflow).
# Requiere yq v4.
set -Eeuo pipefail
trap 'echo -e "\n💥 Falló en la línea $LINENO (cmd: $BASH_COMMAND)\n"' ERR

YQ="${YQ_PATH:-$HOME/bin/yq}"
echo "Using yq at: $YQ"
$YQ --version

JOBS_FILE=".circleci/jobs/${1}"
WF_CSV="${2}"

[[ -f "$JOBS_FILE" ]] || { echo "❌ No existe $JOBS_FILE"; exit 1; }
[[ -n "$WF_CSV"    ]] || { echo "❌ CSV de workflows vacío"; exit 1; }

# Normaliza CSV de workflows a rutas
IFS=',' read -r -a WF_FILES <<< "$WF_CSV"
WF_PATHS=()
for f in "${WF_FILES[@]}"; do
  wf=".circleci/workflows/$(echo "$f" | xargs)"
  [[ -f "$wf" ]] || { echo "❌ No existe $wf"; exit 1; }
  WF_PATHS+=("$wf")
done

echo "🛠 Combinando $JOBS_FILE + ${WF_PATHS[*]} en .circleci/config_final.yml"

# Validar YAMLs de entrada
$YQ e '.' "$JOBS_FILE" >/dev/null
for wf in "${WF_PATHS[@]}"; do $YQ e '.' "$wf" >/dev/null; done

# --- 1) Extraer jobs y executors del archivo de jobs ---
JOBS_TMP="$(mktemp)"
$YQ e -o=json '.jobs // {}' "$JOBS_FILE" > "$JOBS_TMP"

EXECS_TMP="$(mktemp)"
$YQ e -o=json '.executors // {}' "$JOBS_FILE" > "$EXECS_TMP"

# --- 2) Acumulador de workflows (JSON) ---
ACC="$(mktemp)"
echo '{}' | $YQ e '.' -o=json - > "$ACC"

# --- 3) Por cada workflow file: extrae mapa .workflows y concatena .jobs por nombre ---
for wf in "${WF_PATHS[@]}"; do
  WF_MAP_TMP="$(mktemp)"
  # Debe ser un MAPA: { <workflow_name>: { jobs:[...] }, ... }
  $YQ e -o=json '.workflows // {}' "$wf" > "$WF_MAP_TMP"

  # Obtener nombres de workflows en este archivo
  mapfile -t NAMES < <($YQ e -o=json 'keys | .[]' "$WF_MAP_TMP" | sed 's/"//g' || true)

  for NAME in "${NAMES[@]}"; do
    # Jobs de ESTE workflow en ESTE archivo -> tmp
    JOBS_CUR_TMP="$(mktemp)"
    NAME="$NAME" $YQ e -o=json '.[strenv(NAME)].jobs // []' "$WF_MAP_TMP" > "$JOBS_CUR_TMP"

    # Concatena en el acumulador: ACC.workflows[NAME].jobs += JOBS_CUR
    NAME="$NAME" JOBS_CUR_TMP="$JOBS_CUR_TMP" \
    $YQ e -i '
      .workflows[strenv(NAME)].jobs =
        (( .workflows[strenv(NAME)].jobs // [] ) + ( load(env(JOBS_CUR_TMP)) // [] ))
    ' "$ACC"

    rm -f "$JOBS_CUR_TMP"
  done
  rm -f "$WF_MAP_TMP"
done

# --- 4) Armar config final (continuation no admite setup:true) ---
JOBS_TMP="$JOBS_TMP" EXECS_TMP="$EXECS_TMP" ACC="$ACC" $YQ e -n '
  .version = "2.1" |
  .setup = false |
  .jobs = load(env(JOBS_TMP)) |
  .executors = load(env(EXECS_TMP)) |
  .workflows = load(env(ACC)).workflows
' > .circleci/config_final.yml

echo "✅ Config final generada: .circleci/config_final.yml"
head -n 80 .circleci/config_final.yml || true

# Validar salida
$YQ e '.' .circleci/config_final.yml >/dev/null
