data "terraform_remote_state" "aws_vpc" {
    backend = "local"
    config {
        path = "${path.module}/../../aws-vpc-resources/master/terraform.tfstate"
    }
}
