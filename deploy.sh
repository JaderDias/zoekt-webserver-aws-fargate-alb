#!/bin/bash
environment="$1"
if [ -z "$environment" ]
then
    echo "Usage: deploy.sh <environment> <aws_region>"
    exit 1
fi

aws_region="$2"
if [ -z "$aws_region" ]
then
    echo "Usage: deploy.sh <environment> <aws_region>"
    exit 1
fi

echo -e "\n+++++ Starting deployment +++++\n"

cd terraform
terraform init
if [ $? -ne 0 ]
then
    echo "terraform init failed"
    exit 1
fi

terraform workspace new $environment
terraform workspace select $environment

terraform apply --auto-approve \
    --var "region=$aws_region"

echo -e "\n+++++ Deployment done +++++\n"