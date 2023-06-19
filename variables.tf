variable "secret_bucket" {
  type = string
}

variable "aws_role_arn" {
  type = string
}

variable "workloads" {}

variable "gh_secrets" {}

variable "shortlived_kube_token" {
  type    = string
  default = ""
}

variable "kubernetes_version" {
  type = string
  default = "1.25.10-00"
}
