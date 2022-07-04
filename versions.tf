terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      version = ">= 3.0"
      source  = "hashicorp/aws"
    }
    helm = {
      version = ">= 2.0"
      source  = "hashicorp/helm"
    }
  }
}