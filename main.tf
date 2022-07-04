/**
*
* # AWS EKS IRSA role low-level module for Terraform
*
* *by macros*
*
* **Creates IRSA role without any policies**. 
* 
* ```
* # Usage example:
* module "eks_role_for_app" {
*   source = "git@github.com:ncs-io/aws-eks-irsa-role.git?ref=v1.0"
*   cluster_name = "MY_CLUSTER_NAME"
*   serviceaccount = "aws-load-balancer-controller"
* }
* ```
*
* For full example, see [./examples](./examples).
*/

data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}

locals {
  oidc_eks_url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  oidc_eks_arn = data.aws_iam_openid_connect_provider.this.arn

  role_name = join("-", compact([var.cluster_name, var.namespace, var.role_name]))
}

data "aws_iam_policy_document" "oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(local.oidc_eks_url, "https://", "")}:sub"
      values   = ["system:serviceaccount:${var.namespace}:${var.serviceaccount}"]
    }

    principals {
      identifiers = [local.oidc_eks_arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "eks_iam_service_role" {
  assume_role_policy = data.aws_iam_policy_document.oidc_assume_role_policy.json
  name               = var.suffixed == false ? local.role_name : null
  name_prefix        = var.suffixed == true ? local.role_name : null
  tags               = var.tags
  description        = var.description
}

output "arn" {
  value       = aws_iam_role.eks_iam_service_role.arn
  description = "ARN of a created role"
}

output "name" {
  value       = aws_iam_role.eks_iam_service_role.name
  description = "Full name of a created role"
}

