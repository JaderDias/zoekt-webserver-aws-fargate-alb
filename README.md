# zoekt-webserver-aws-fargate-alb

zoekt-webserver hosted in Amazon Web Services using Elastic Container Service and Fargate

## Prerequisites

1. Docker installed and running
2. Terraform

## Deployment

1. `go install github.com/google/zoekt/cmd/zoekt-index@latest`
2. `cd project`
3. `$GOPATH/bin/zoekt-index $FOLDERYOUWANTTOINDEX`
4. `cd ..`
5. `./deploy.sh <environment> <aws_region>`