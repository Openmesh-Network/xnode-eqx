terraform {
  backend "s3" {
    bucket   = "terraform-data-aws-l3a-global"
    encrypt  = true
    key      = "applications/k8s.tfstate"
    region   = "ap-southeast-2"
    role_arn = "arn:aws:iam::849828677909:role/super"
  }
}

#provider "aws" {
#  assume_role {
#    role_arn = "arn:aws:iam::877761402689:role/super"
#  }
#  region = "eu-west-1"
#}
#
#provider "aws" {
#  alias = "use1"
#  assume_role {
#    role_arn = "arn:aws:iam::877761402689:role/super"
#  }
#  region = "us-east-1"
#}
#
#provider "aws" {
#  alias  = "shared"
#  assume_role {
#    role_arn = "arn:aws:iam::674303559863:role/super"
#  }
#  region = "eu-west-1"
#}
