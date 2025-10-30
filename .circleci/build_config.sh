#!/bin/bash
set -Eeuo pipefail
trap 'echo -e "\n💥 Falló en la línea $LINENO (cmd: $BASH_COMMAND)\n"' ERR
set -x

YQ="${YQ_PATH:-$HOME/bin/yq}"
echo "Using yq at: $YQ"
$YQ --version

JOBS_FILE=".circleci/jobs/${1}"
WF_CSV="${2}"

[[ -f "$JOBS_FILE" ]] || { echo "❌ No existe $JOBS_FILE"; exit 1; }
[[ -n "$WF_CSV"    ]] || { echo "❌ CSV de workflows vacío"; exit 1; }

IFS=',' read -r -a WF_FILES <<< "$WF_CSV"
WF_PATHS=()
for f in "${WF_FILES[@]}"; do
  wf=".circleci/workflows/$(echo "$f" | xargs)"
  [[ -f "$wf" ]] || { echo "❌ No existe $wf"; exit 1; }
  WF_PATHS+=("$wf")
done

echo "🛠 Combinando $JOBS_FILE + ${WF_PATHS[*]} en .circleci/config_final.yml"

# Validar YAMLs
$YQ e '.' "$JOBS_FILE" >/dev/null
for wf in "${WF_PATHS[@]}"; do $YQ e '.' "$wf" >/dev/null; done

# 1) Jobs → JSON a archivo temp
JOBS_TMP="$(mktemp)"
$YQ e -o=json '.jobs // {}' "$JOBS_FILE" > "$JOBS_TMP"

# 2) Extraer SOLO .workflows de cada workflow file a temporales (como mapas)
TMP_LIST=()
for wf in "${WF_PATHS[@]}"; do
  t="$(mktemp)"
  # Debe ser un mapa: { <nombre_workflow>: { jobs: [...] }, ... }
  $YQ e -o=json '.workflows // {}' "$wf" > "$t"
  TMP_LIST+=("$t")
done

# 3) Merge de workflows concatenando listas jobs por nombre
WF_TMP="$(mktemp)"
$YQ eval-all -o=json '
  # Cada input es un mapa con uno o más workflows
  reduce inputs as $d ({}; 
    . as $acc |
    ($d | to_entries) as $entries |
    reduce $entries[] as $e ($acc;
      .[$e.key].jobs = (( .[$e.key].jobs // [] ) + ( $e.value.jobs // [] ))
    )
  )
' "${TMP_LIST[@]}" > "$WF_TMP"

# 4) Armar config_final.yml cargando desde archivos (sin --argjson)
JOBS_TMP="$JOBS_TMP" WF_TMP="$WF_TMP" $YQ eval -n '
  .version = "2.1" |
  .setup = false |
  .jobs = load(env(JOBS_TMP)) |
  .workflows = load(env(WF_TMP))
' > .circleci/config_final.yml

echo "✅ Config final generada: .circleci/config_final.yml"
head -n 60 .circleci/config_final.yml || true

# Validar salida
$YQ e '.' .circleci/config_final.yml >/dev/null
