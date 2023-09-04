_01_base_services = [
  {
    name = "coredns"
    namespace = "kube-system"
    type = "deployment.apps"
  },
  {
    name = "calico-kube-controllers"
    namespace = "calico-system"
    type = "deployment.apps"
  },
  {
    name = "calico-typha"
    namespace = "calico-system"
    type = "deployment.apps"
  },
  {
    name = "calico-apiserver"
    namespace = "calico-apiserver"
    type = "deployment.apps"
  },
  {
    name = "tigera-operator"
    namespace = "tigera-operator"
    type = "deployment.apps"
  },
]
