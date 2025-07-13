#!/bin/bash
set -e

STACKS="$1"
CONFIG_CUENTA="$2"

echo "📦 Generando config_final.yml para stacks: $STACKS con configuración de cuenta: $CONFIG_CUENTA"

CONFIG_FILE=".circleci/jobs/${CONFIG_CUENTA}"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "❌ Configuración de cuenta no encontrada: $CONFIG_FILE"
  exit 1
fi

# 🔧 Empieza con la configuración base de la cuenta (version, executor, job: deploy)
cat "$CONFIG_FILE" > .circleci/config_final.yml

# 🔧 Asegura salto de línea entre jobs y workflows
echo "" >> .circleci/config_final.yml

# 🔧 Inicia workflows
echo "workflows:" >> .circleci/config_final.yml
echo "  deploy-dynamic:" >> .circleci/config_final.yml
echo "    jobs:" >> .circleci/config_final.yml

# 🔐 Aprobación manual
echo "      - approval:" >> .circleci/config_final.yml
echo "          name: Tech lead approvement prod 👓 👨‍💻" >> .circleci/config_final.yml
echo "          type: approval" >> .circleci/config_final.yml
echo "          filters:" >> .circleci/config_final.yml
echo "            branches:" >> .circleci/config_final.yml
echo "              only: main" >> .circleci/config_final.yml
echo "" >> .circleci/config_final.yml

# 🔁 Agrega todos los workflows de stacks seleccionados
for STACK in $(echo $STACKS | tr "," "\n"); do
  WORKFLOW_FILE=".circleci/workflows/${STACK}.yaml"

  if [[ -f "$WORKFLOW_FILE" ]]; then
    echo "🔗 Agregando workflow: $WORKFLOW_FILE"
    cat "$WORKFLOW_FILE" >> .circleci/config_final.yml
    echo "" >> .circleci/config_final.yml
  else
    echo "⚠️  Workflow no encontrado para stack: $STACK"
  fi
done

echo "✅ Configuración final generada:"
cat .circleci/config_final.yml
