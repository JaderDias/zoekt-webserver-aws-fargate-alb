#!/bin/sh
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

cd terraform

terraform workspace new $environment
terraform workspace select $environment

terraform apply -destroy \
    --var "region=$aws_region"
    
cd ..