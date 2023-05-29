provider aws {
  alias     = "apse2"
  region    = "ap-southeast-2"
  assume_role {
    role_arn  = "arn:aws:iam::849828677909:role/super"
  }
}
