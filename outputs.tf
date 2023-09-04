output "kubernetes_api_address" {
  description = "The address of the Kubernetes API"
  value       = module.multiarch-k8s.kubernetes_api_address
}

output "network_cidr" {
  description = "cidr_notation"
  value       = module.multiarch-k8s.network_cidr
}

output "first_ip" {
  description = "first_ip"
  value       = module.multiarch-k8s.first_ip
}

output "client_name" {
  description = "client_name"
  value       = var.client_name
}

output "product_name" {
  description = "product_name"
  value       = local.equinix_metal_project_prefix_name
}

output "product_version" {
  description = "product_version"
  value       = var.product_version
}

output "project_id" {
  description = "project_id"
  value       = random_string.project_id.result
}
