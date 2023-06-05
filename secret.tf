resource "null_resource" "kubeconfig_to_s3" {
  for_each = local.secrets

  provisioner "local-exec" {
    environment = {
      aws_role_arn = var.aws_role_arn
      path         = "${terraform.workspace}/${local.equinix_metal_project_prefix_name}-${var.product_version}-${random_string.project_id.result}"
      file         = each.key
      bucket       = var.bucket
    }
    command = "sh ${path.module}/scripts/copy_to_s3.sh"
  }

  depends_on = [module.multiarch-k8s]
}
