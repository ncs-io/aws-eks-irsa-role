# Set this up or use your variables
locals {
  cluster_name = "MY_CLUSTER_NAME"
  region       = "eu-central-1"
}

module "alb_role" {
  source         = "../"
  serviceaccount = "example-serviceaccount-name"
  cluster_name   = local.cluster_name
  namespace      = "kube-system" # omit for default
  role_name      = "exmpl"

  tags = {
    "Example" = "Foo"
  }
}