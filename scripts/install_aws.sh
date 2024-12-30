#!/bin/bash

set -o errexit  # abort on nonzero exitstatus
set -o nounset  # abort on unbound variable
set -o pipefail # don't hide errors within pipes

# Input parameters
readonly DEPLOY_ENV=$1
readonly PIPELINE_NUMBER=$2

# Colors
readonly INFO='\033[1;34m'
readonly GREEN='\033[0;32m'
readonly RED='\033[0;31m'
readonly NC='\033[0m' # No Color

# Constants
# lab = ohio
# prod = oregon
readonly envs='{
    "dev":"us-east-2",
    "prodb": "us-west-2"
}'

# Checking if aws cli is installed
#if ! which aws >/dev/null; then
#    echo -e "$INFO""Installing aws cli ☁️ 📦""$NC"
#    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#    curl -u "$JFROG_USER":"$JFROG_PASS" https://bgxpa.jfrog.io/artifactory/yappy-pipeline-scripts/awscli_signature.pub --output awscli_signature.pub
#    curl -o awscliv2.sig https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip.sig
#    gpg --import awscli_signature.pub
#    gpg --verify awscliv2.sig awscliv2.zip
#    unzip -q awscliv2.zip
#    sudo ./aws/install
#fi

echo -e "$INFO""Setting aws Environment ⚙️ 🔧""$NC"

env=$(echo "$envs" | jq -r ".$DEPLOY_ENV")
readonly env

if [[ "$env" = "null" ]]; then
    echo -e "$RED""not  📖"
    exit 1
fi

echo "export AWS_REGION=$env" >> "$BASH_ENV"
echo "export BUILD_NUMBER=$PIPELINE_NUMBER" >> "$BASH_ENV"
source $BASH_ENV

echo -e "$GREEN""AWS_REGION: $AWS_REGION"
echo -e "$GREEN""DEPLOY_ENV: $DEPLOY_ENV"

echo -e "$GREEN""Install AWS CLI & set up successfully 🔥"
