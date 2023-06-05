variable "bucket" {
  type = string
}

variable "aws_role_arn" {
  type = string
}

variable "infra_version" {
  type = string
}

variable "workloads" {}

variable "gh_secrets" {
}

variable "shortlived_kube_token" {
  type = string
  default = ""
}
