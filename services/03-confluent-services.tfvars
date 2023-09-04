_03_confluent_services = [
  {
    name = "confluent-operator"
    namespace = "confluent"
    type = "deployment.apps"
  },
  {
    name = "zookeeper"
    namespace = "confluent"
    type = "statefulset.apps"
  },
  {
    name = "kafka"
    namespace = "confluent"
    type = "statefulset.apps"
  },
  {
    name = "schemaregistry"
    namespace = "confluent"
    type = "statefulset.apps"
  },
]
