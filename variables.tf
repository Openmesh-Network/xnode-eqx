variable "aws_role_arn" {
  type = string
}

variable "client_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "gh_secrets" {}

variable "kubernetes_version" {
  type = string
  default = "1.25.10-00"
}

variable "secret_bucket" {
  type = string
}

variable "shortlived_kube_token" {
  type    = string
  default = ""
}

variable "workloads" {}
