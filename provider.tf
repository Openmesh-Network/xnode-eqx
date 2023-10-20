provider "aws" {
  alias  = "apse2"
  region = "ap-southeast-2"
  assume_role {
    role_arn = var.aws_role_arn
  }
}
