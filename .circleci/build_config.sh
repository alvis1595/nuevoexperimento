#!/bin/bash
set -e

JOBS_FILE=".circleci/jobs/$1"
WORKFLOW_FILE=".circleci/workflows/$2"

if [[ ! -f "$JOBS_FILE" ]]; then
  echo "❌ Archivo de jobs no encontrado: $JOBS_FILE"
  exit 1
fi

if [[ ! -f "$WORKFLOW_FILE" ]]; then
  echo "❌ Archivo de workflow no encontrado: $WORKFLOW_FILE"
  exit 1
fi

echo "🛠 Combinando $JOBS_FILE + $WORKFLOW_FILE en config_final.yml"
yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' "$JOBS_FILE" "$WORKFLOW_FILE" > .circleci/config_final.yml
echo "✅ Combinación completada."