variable "port" {
  description = "port the container exposes, that the load balancer should forward port 80 to"
  default     = "6070"
}

variable "source_path" {
  description = "source path for project"
  default     = "./project"
}

variable "tag" {
  description = "tag to use for our new docker image"
  default     = "latest"
}

resource "random_pet" "this" {
  length = 2
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

resource "aws_cloudwatch_log_group" "dummyapi" {
  name = "${terraform.workspace}-log-group"

  tags = {
    Environment = "staging"
    Application = "${terraform.workspace}-app"
  }
}

resource "null_resource" "push_docker_image" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    working_dir = "../"
    command     = "./push_docker_image.sh ${var.source_path} ${aws_ecr_repository.repo.repository_url} ${var.tag} ${data.aws_caller_identity.current.account_id}"
    interpreter = ["bash", "-c"]
  }
}
