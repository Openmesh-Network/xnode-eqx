_10_openmesh_services = [
  {
    name = "superset"
    namespace = "openmesh"
    type = "deployment.apps"
  },
  {
    name = "superset-worker"
    namespace = "openmesh"
    type = "deployment.apps"
  },
  {
    name = "postgres-postgresql"
    namespace = "openmesh"
    type = "statefulset.apps"
  },
  {
    name = "superset-redis-master"
    namespace = "openmesh"
    type = "statefulset.apps"
  },
]
