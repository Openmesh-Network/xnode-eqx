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
  services = concat(var._01_base_services, 
                    var._02_base_services,
                    var._03_confluent_services,
                    var._04_observability_services,
                    var._10_l3a_services)
}
