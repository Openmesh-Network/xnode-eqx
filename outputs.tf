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
