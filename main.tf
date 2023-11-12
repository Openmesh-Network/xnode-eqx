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
  default     = ""
}

variable "product_version" {
  type        = string
  description = "L3a major product version"
}

variable "project_id" {
  type        = string
  description = "Equinix Metal Project ID"
  default     = ""
}

variable "metro" {
  type        = string
  description = "Equinix Metal Metro"
  default     = "ny"
}

module "shortlived-kube-token" {
  source = "git@github.com:L3A-Protocol/kube-token.git"
}

module "multiarch-k8s" {
  #source = "git@github.com:L3A-Protocol/k8s-eqx-module.git?ref=v0.0.2-beta.1"
  source     = "git@github.com:L3A-Protocol/k8s-eqx-module.git"
  depends_on = [module.shortlived-kube-token]

  auth_token   = var.auth_token
  ccm_enabled  = var.ccm_enabled
  cluster_name = var.cluster_name != "" ? var.cluster_name : random_string.project_id.result
  count_arm    = var.single_xnode == true ? 0 : var.count_arm
  count_x86    = var.single_xnode == true ? 0 : var.count_x86
  metro        = var.metro
  project_id   = var.project_id != "" ? var.project_id : random_string.project_id.result
  #===
  equinix_metal_project_name = "${local.equinix_metal_project_prefix_name}-${var.product_version}-${var.cluster_name != "" ? var.cluster_name : random_string.project_id.result}"
  features                   = var.features
  gh_secrets                 = var.gh_secrets
  kubernetes_version         = var.kubernetes_version
  organization_id            = var.organization_id != "" ? var.organization_id : null
  shortlived_kube_token      = var.shortlived_kube_token != "" ? var.shortlived_kube_token : module.shortlived-kube-token.token
  single_xnode               = var.single_xnode
  workloads                  = var.workloads
  grafana                    = [ for g in local.grafana : { name = g, token = random_id.grafana_access_tokens[g].hex }]
}

provider "equinix" {
  auth_token = var.auth_token
}

output "multiarch-k8s" {
  value     = module.multiarch-k8s
  sensitive = true
}
