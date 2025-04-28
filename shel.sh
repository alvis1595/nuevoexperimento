for param in $(aws ssm describe-parameters --query "Parameters[].Name" --output text)
do
  aws ssm add-tags-to-resource \
    --resource-type "Parameter" \
    --resource-id "$param" \
    --tags Key=Environment,Value=Production Key=Owner,Value=DevOps
done