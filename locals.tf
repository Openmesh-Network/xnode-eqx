locals {
  equinix_metal_project_prefix_name = "xnode"
  secrets = {
    kubeconfig = {
      file_name = "kubeconfig"
    }
    metal_key = {
      file_name = "metal_key"
    }
  }
  services = concat(
    var._01_base_services,
    var._02_base_services,
    var._03_confluent_services,
    var._04_observability_services,
    var._10_openmesh_services
  )
  grafana = [
    "openmesh",
    "kafka"
  ]
}
