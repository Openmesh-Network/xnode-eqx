locals {
  equinix_metal_project_prefix_name = "l3a"
  secrets = {
    kubeconfig = {
      file_name = "kubeconfig"
    }
    metal_key  = {
      file_name = "metal_key"
    }
  }
}
