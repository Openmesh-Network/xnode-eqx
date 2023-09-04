_04_observability_services = [
  {
    name = "prometheus-server"
    namespace = "observability"
    type = "deployment.apps"
  },
  {
    name = "prometheus-pushgateway"
    namespace = "observability"
    type = "deployment.apps"
  },
  {
    name = "prometheus-kube-state-metrics"
    namespace = "observability"
    type = "deployment.apps"
  },
  {
    name = "grafana"
    namespace = "observability"
    type = "deployment.apps"
  },
]
