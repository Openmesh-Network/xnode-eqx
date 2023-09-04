resource "null_resource" "modify_kubeconfig" {
  depends_on = [module.multiarch-k8s]

  provisioner "local-exec" {
    environment = {
      file                   = "kubeconfig"
      kubernetes_api_address = module.multiarch-k8s.kubernetes_api_address
    }
    command = "chmod +x ${path.module}/scripts/modify_kubeconfig.sh; ${path.module}/scripts/modify_kubeconfig.sh"
  }
}

resource "null_resource" "copy_defined_secrets_to_s3" {
  depends_on = [module.multiarch-k8s, null_resource.modify_kubeconfig]

  for_each = local.secrets

  provisioner "local-exec" {
    environment = {
      aws_role_arn = var.aws_role_arn
      path         = "${terraform.workspace}/${local.equinix_metal_project_prefix_name}-${var.product_version}-${random_string.project_id.result}"
      file         = each.value["file_name"]
      bucket       = var.secret_bucket
    }
    command = "chmod +x ${path.module}/scripts/transfer_to_s3.sh; ${path.module}/scripts/transfer_to_s3.sh upload"
  }
}

resource "null_resource" "copy_host_secrets_to_s3" {
  depends_on = [module.multiarch-k8s]
  count = var.count_x86

  provisioner "local-exec" {
    environment = {
      aws_role_arn = var.aws_role_arn
      path         = "${terraform.workspace}/${local.equinix_metal_project_prefix_name}-${var.product_version}-${random_string.project_id.result}"
      file         = "${var.cluster_name != "" ? var.cluster_name : random_string.project_id.result}-x86-blue-0${count.index}_secret.asc"
      bucket       = var.secret_bucket
    }
    command = "chmod +x ${path.module}/scripts/transfer_to_s3.sh; ${path.module}/scripts/transfer_to_s3.sh upload"
  }
}

resource "null_resource" "copy_controller_secrets_to_s3" {
  depends_on = [module.multiarch-k8s]

  provisioner "local-exec" {
    environment = {
      aws_role_arn = var.aws_role_arn
      path         = "${terraform.workspace}/${local.equinix_metal_project_prefix_name}-${var.product_version}-${random_string.project_id.result}"
      file         = "${var.cluster_name != "" ? var.cluster_name : random_string.project_id.result}-controller-primary_secret.asc"
      bucket       = var.secret_bucket
    }
    command = "chmod +x ${path.module}/scripts/transfer_to_s3.sh; ${path.module}/scripts/transfer_to_s3.sh upload"
  }
}

resource "null_resource" "download_defined_secrets_from_s3" {
  depends_on = [module.multiarch-k8s, null_resource.copy_controller_secrets_to_s3, null_resource.modify_kubeconfig]

  for_each = local.secrets

  provisioner "local-exec" {
    environment = {
      aws_role_arn = var.aws_role_arn
      path         = "${terraform.workspace}/${local.equinix_metal_project_prefix_name}-${var.product_version}-${random_string.project_id.result}"
      file         = each.value["file_name"]
      bucket       = var.secret_bucket
    }
    command = "chmod +x ${path.module}/scripts/transfer_to_s3.sh; ${path.module}/scripts/transfer_to_s3.sh download"
  }
}
