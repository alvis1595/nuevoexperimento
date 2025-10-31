#!/bin/bash
# build_config.sh
# Combina 1 archivo de jobs (jobs + executors) con N archivos de workflows.
# Admite workflow_files como CSV ("a.yaml,b.yaml") o JSON (["a.yaml","b.yaml"])
set -Eeuo pipefail
trap 'echo -e "\n💥 Falló en la línea $LINENO (cmd: $BASH_COMMAND)\n"' ERR

YQ="${YQ_PATH:-$HOME/bin/yq}"
echo "Using yq at: $YQ"
"$YQ" --version

JOBS_FILE=".circleci/jobs/${1:-}"
WF_INPUT="${2:-}"

[[ -n "$JOBS_FILE" ]] || { echo "❌ Falta arg1: jobs_file"; exit 1; }
[[ -n "$WF_INPUT"  ]] || { echo "❌ Falta arg2: workflow_files_csv (CSV o JSON)"; exit 1; }
[[ -f "$JOBS_FILE" ]] || { echo "❌ No existe $JOBS_FILE"; exit 1; }

# --- Parsear workflows: JSON array o CSV ---
WF_FILES=()
if [[ "$WF_INPUT" =~ ^[[:space:]]*\[ ]]; then
  # JSON
  mapfile -t WF_FILES < <(printf '%s' "$WF_INPUT" | "$YQ" -p=json -r e '.[]' -)
else
  # CSV
  IFS=',' read -r -a WF_FILES <<< "$WF_INPUT"
fi

# Normalizar rutas y validar existencia
WF_PATHS=()
for f in "${WF_FILES[@]}"; do
  wf=".circleci/workflows/$(echo "$f" | xargs)"
  [[ -f "$wf" ]] || { echo "❌ No existe $wf"; exit 1; }
  WF_PATHS+=("$wf")
done

echo "🛠 Combinando $JOBS_FILE + ${WF_PATHS[*]} en .circleci/config_final.yml"

# Validar YAMLs de entrada
"$YQ" e '.' "$JOBS_FILE" >/dev/null
for wf in "${WF_PATHS[@]}"; do "$YQ" e '.' "$wf" >/dev/null; done

# --- 1) Extraer jobs y executors del archivo de jobs ---
JOBS_TMP="$(mktemp)";   "$YQ" e -o=json '.jobs // {}'       "$JOBS_FILE" > "$JOBS_TMP"
EXECS_TMP="$(mktemp)";  "$YQ" e -o=json '.executors // {}'  "$JOBS_FILE" > "$EXECS_TMP"

# --- 2) Acumulador de workflows (JSON) ---
ACC="$(mktemp)"; echo '{}' | "$YQ" e '.' -o=json - > "$ACC"

# --- 3) Por cada workflow file: extrae mapa .workflows y concatena .jobs por nombre ---
for wf in "${WF_PATHS[@]}"; do
  WF_MAP_TMP="$(mktemp)"
  "$YQ" e -o=json '.workflows // {}' "$wf" > "$WF_MAP_TMP"

  mapfile -t NAMES < <("$YQ" -r e 'keys | .[]' "$WF_MAP_TMP" || true)
  for NAME in "${NAMES[@]}"; do
    JOBS_CUR_TMP="$(mktemp)"
    NAME="$NAME" "$YQ" e -o=json '.[strenv(NAME)].jobs // []' "$WF_MAP_TMP" > "$JOBS_CUR_TMP"

    NAME="$NAME" JOBS_CUR_TMP="$JOBS_CUR_TMP" \
    "$YQ" e -i '
      .workflows[strenv(NAME)].jobs =
        (( .workflows[strenv(NAME)].jobs // [] ) + ( load(env(JOBS_CUR_TMP)) // [] ))
    ' "$ACC"

    rm -f "$JOBS_CUR_TMP"
  done
  rm -f "$WF_MAP_TMP"
done

# --- 4) Armar config final (continuation no admite setup:true)
#     Además, añadimos parameters "dummy" para que NO falle si alguien hace
#     "Rerun with parameters" en el pipeline hijo por error.
JOBS_TMP="$JOBS_TMP" EXECS_TMP="$EXECS_TMP" ACC="$ACC" "$YQ" e -n '
  .version = "2.1" |
  .setup = false |
  .parameters.jobs_file.type = "string" |
  .parameters.jobs_file.default = "" |
  .parameters.workflow_files_csv.type = "string" |
  .parameters.workflow_files_csv.default = "" |
  .jobs = load(env(JOBS_TMP)) |
  .executors = load(env(EXECS_TMP)) |
  .workflows = load(env(ACC)).workflows
' > .circleci/config_final.yml

echo "✅ Config final generada: .circleci/config_final.yml"
head -n 120 .circleci/config_final.yml || true
"$YQ" e '.' .circleci/config_final.yml >/dev/null
