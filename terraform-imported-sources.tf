data "terraform_remote_state" "aws_vpc" {
    backend = "local"
    config {
        path = "${path.module}/../../aws-vpc-resources/master/terraform.tfstate"
    }
}

data "terraform_remote_state" "aws_iam" {
  backend = "local"
  config {
    path = "${path.module}/../../aws-iam-resources/master/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_ecs" {
  backend = "local"
  config {
    path = "${path.module}/../../aws-ecs/master/terraform.tfstate"
  }
}
