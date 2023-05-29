resource "aws_s3_object" "this" {
  provider = aws.apse2

  for_each = local.secrets
  bucket = "terraform-data-eqx-secrets"
  key    = "${terraform.workspace}/${var.equinix_metal_project_prefix_name}-${random_string.project_id.result}/${each.key}"
  source = each.key
  
  depends_on = [ module.multiarch-k8s ] 
}
