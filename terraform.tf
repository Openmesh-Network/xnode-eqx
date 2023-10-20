terraform {
  backend "s3" {
    bucket   = "terraform-state-openmesh-global"
    encrypt  = true
    key      = "applications/k8s.tfstate"
    region   = "ap-southeast-2"
    role_arn = "arn:aws:iam::849828677909:role/super"
  }
}
