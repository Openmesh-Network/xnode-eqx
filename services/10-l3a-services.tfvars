_10_l3a_services = [
  {
    name = "superset"
    namespace = "l3a-v3"
    type = "deployment.apps"
  },
  {
    name = "superset-worker"
    namespace = "l3a-v3"
    type = "deployment.apps"
  },
  {
    name = "postgres-postgresql"
    namespace = "l3a-v3"
    type = "statefulset.apps"
  },
  {
    name = "superset-redis-master"
    namespace = "l3a-v3"
    type = "statefulset.apps"
  },
]
