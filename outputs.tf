output "kubernetes_api_address" {
  description = "The address of the Kubernetes API"
  value       = module.multiarch-k8s.kubernetes_api_address
}
