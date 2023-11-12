resource "random_string" "project_id" {
  length  = 6
  special = false
  upper   = false
}

resource "random_id" "grafana_access_tokens" {
  for_each = toset(local.grafana)
  byte_length  = 16
}
