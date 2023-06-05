# main.tf
variable "auth_token" {
  type        = string
  description = "Equinix Metal API key"
  sensitive   = true
}

variable "count_x86" {
  type        = string
  description = "Number of x86 nodes"
  default     = "0"
}

variable "ccm_enabled" {
  type        = string
  description = "Whether CCM is enabled"
  default     = "true"
}

variable "count_arm" {
  type        = string
  description = "Number of ARM nodes"
  default     = "0"
}

variable "cluster_name" {
  type        = string
  description = "Name of your cluster. Alpha-numeric and hyphens only, please."
  default     = "metal-multiarch-k8s"
}

variable "product_version" {
  type        = string
  description = "L3a major product version"
}

variable "equinix_metal_project_prefix_name" {
  type        = string
  default     = "l3a"
  description = "L3a project name, almost always l3a"
}

#variable "project_id" {
#  type        = string
#  description = "Equinix Metal Project ID"
#}

variable "metro" {
  type        = string
  description = "Equinix Metal Metro"
  default     = "da"
}


module "multiarch-k8s" {
  #source = "../.."
  source = "git@github.com:L3A-Protocol/k8s-eqx-module.git"
  # source  = "equinix/multiarch-k8s/metal"
  # version = "0.5.0" # Use the latest version, according to https://github.com/equinix/terraform-metal-multiarch-k8s/releases

  auth_token = var.auth_token
  project_id = random_string.project_id.result
  metro      = var.metro
  count_arm  = var.count_arm
  count_x86  = var.count_x86
  #cluster_name = var.cluster_name
  cluster_name = random_string.project_id.result
  ccm_enabled  = var.ccm_enabled
  #===
  equinix_metal_project_name = "${var.equinix_metal_project_prefix_name}-${var.infra_version}-${random_string.project_id.result}"
  kubernetes_version         = "1.25.10-00"
  workloads = var.workloads
  gh_secrets = var.gh_secrets
  shortlived_kube_token = var.shortlived_kube_token
}

provider "equinix" {
  auth_token = var.auth_token
}

output "multiarch-k8s" {
  value     = module.multiarch-k8s
  sensitive = true
}
