nueva estructura:
.circleci/
├── config.yml                   # setup pipeline principal
├── build_config.sh             # script para combinar
├── jobs/
│   ├── config_jobs_cuenta1.yml
│   ├── config_jobs_cuenta2.yml
│   └── ...
├── workflows/
│   ├── config_workflows_vpc.yml
│   ├── config_workflows_ecs.yml
│   └── ...

----------------------------build_config.sh  -----------------
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
-------------------------------------------------------------------
config.yaml

version: 2.1

setup: true

orbs:
  continuation: circleci/continuation@0.1.2

parameters:
  jobs_file:
    type: string
    default: config_jobs_cuenta1.yml
  workflow_file:
    type: string
    default: config_workflows_vpc.yml

workflows:
  setup:
    jobs:
      - trigger_pipeline:
          jobs_file: << pipeline.parameters.jobs_file >>
          workflow_file: << pipeline.parameters.workflow_file >>
jobs:
  trigger_pipeline:
    docker:
      - image: cimg/base:stable
    parameters:
      jobs_file:
        type: string
      workflow_file:
        type: string
    steps:
      - checkout
      - run:
          name: Instalar yq
          command: sudo apt-get update && sudo apt-get install -y yq
      - run:
          name: Combinar archivos jobs + workflow
          command: |
            bash .circleci/build_config.sh << parameters.jobs_file >> << parameters.workflow_file >>
      - continuation/continue:
          configuration_path: .circleci/config_final.yml

-----------------------------------------------------------------------------------------------------------------------------------
