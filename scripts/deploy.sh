#!/bin/bash
# pruebas
readonly red='\033[0;31m'
readonly green='\033[7;92m'

readonly templateFilePath="$HOME/project/$1"
readonly resource="$2"
readonly infraName="${ENTERPRISE_NAME}-${GROUP_NAME}-${SERVICE_NAME}-${resource}"

echo ' ===>  used var env  <=====
      RESOURCE:'"$resource"',
      GROUP_NAME:'"$GROUP_NAME"',
      DEPLOY_ENV:'"$DEPLOY_ENV"',
      AWS_REGION:'"$AWS_REGION"',
      SERVICE_NAME:'"$SERVICE_NAME"',
      ENTERPRISE_NAME:'"$ENTERPRISE_NAME"',
'

echo ' ====>  Cloudformation Info  <=====
      RESOURCE_NAME: '"$resource"'
      RESOURCE_CLOUDFORMATION_STACK_NAME: '"$infraName"'
'

echo -e "${green} Spinning cloudformation..."

echo "aws cloudformation deploy --stack-name $infraName --template-file $templateFilePath --capabilities CAPABILITY_NAMED_IAM"
aws cloudformation deploy --stack-name "$infraName" --template-file "$templateFilePath" \
    --capabilities CAPABILITY_NAMED_IAM \
    --tags "ORGANIZATION=BGENERAL" "DEPARTMENT=DSO" "CATEGORY=STACK" "SERVICE_TYPE=CLOUDFORMATION" "ENVIRONMENT=$DEPLOY_ENV" "Name=$infraName"

if [ $? != 0 ]; then
    echo -e "${red} Failed Cloudformation stack deployment..."
    aws cloudformation describe-stack-events --stack-name "$infraName"
    exit 1
fi
echo 'Cloudformation Deploy finished...'
