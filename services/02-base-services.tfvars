_02_base_services = [
  {
    name = "controller"
    namespace = "metallb-system"
    type = "deployment.apps"
  },
  {
    name = "cloud-provider-equinix-metal"
    namespace = "kube-system"
    type = "deployment.apps"
  },
  {
    name = "ingctl-ingress-nginx-controller"
    namespace = "kube-system"
    type = "deployment.apps"
  },
  {
    name = "cert-manager"
    namespace = "cert-manager"
    type = "deployment.apps"
  },
  {
    name = "cert-manager-cainjector"
    namespace = "cert-manager"
    type = "deployment.apps"
  },
  {
    name = "cert-manager-webhook"
    namespace = "cert-manager"
    type = "deployment.apps"
  },
]
