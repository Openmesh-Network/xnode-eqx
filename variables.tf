variable "_01_base_services" {
  default = []
}

variable "_02_base_services" {
  default = []
}

variable "_03_confluent_services" {
  default = []
}

variable "_04_observability_services" {
  default = []
}

variable "_10_openmesh_services" {
  default = []
}

variable "aws_role_arn" {
  type = string
}

variable "check_status" {
  type    = bool
  default = false
}

variable "client_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "gh_secrets" {}

variable "kubernetes_version" {
  type    = string
  default = "1.25.10-00"
}

variable "secret_bucket" {
  type = string
}

variable "service" {
  default = {}
}

variable "shortlived_kube_token" {
  type    = string
  default = ""
}

variable "workloads" {}
variable "features" {}
