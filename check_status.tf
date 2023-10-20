resource "null_resource" "check_status" {
  depends_on = [module.multiarch-k8s]
  for_each   = { for service in local.services : service.name => service }

  provisioner "local-exec" {
    environment = {
      command = "kubectl rollout status -n ${each.value.namespace} ${each.value.type}/${each.value.name}"
    }
    command = "chmod +x ${path.module}/scripts/check_status.sh; ${path.module}/scripts/check_status.sh"
  }
}
