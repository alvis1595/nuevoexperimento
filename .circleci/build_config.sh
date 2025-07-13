#!/bin/bash
set -e

STACKS="$1"
CONFIG_CUENTA="$2"

echo "📦 Generando config_final.yml para stacks: $STACKS con config: $CONFIG_CUENTA"

CONFIG_FILE=".circleci/jobs/${CONFIG_CUENTA}"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "❌ Configuración de cuenta no encontrada: $CONFIG_FILE"
  exit 1
fi

# Agrega definición base (cuenta)
cat "$CONFIG_FILE" > .circleci/config_final.yml

# Agrega workflows
echo "workflows:" >> .circleci/config_final.yml
echo "  deploy-dynamic:" >> .circleci/config_final.yml
echo "    jobs:" >> .circleci/config_final.yml

# Aprobación
echo "      - approval:" >> .circleci/config_final.yml
echo "          name: Tech lead approvement prod 👓 👨‍💻" >> .circleci/config_final.yml
echo "          type: approval" >> .circleci/config_final.yml
echo "          filters:" >> .circleci/config_final.yml
echo "            branches:" >> .circleci/config_final.yml
echo "              only: main" >> .circleci/config_final.yml

# Agrega cada bloque de workflow según los stacks solicitados
for STACK in $(echo $STACKS | tr "," "\n"); do
  cat ".circleci/workflows/${STACK}.yaml" >> .circleci/config_final.yml
done
