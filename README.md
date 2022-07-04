
# AWS EKS IRSA role low-level module for Terraform

*by macros*

**Creates IRSA role without any policies**.

```
# Usage example:
module "eks_role_for_app" {
  source = "git@github.com:ncs-io/aws-eks-irsa-role.git?ref=v1.0"
  cluster_name = "MY_CLUSTER_NAME"
  serviceaccount = "aws-load-balancer-controller"
}
```

For full example, see [./examples](./examples).

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS cluster name | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | description | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace of the ServiceAccount | `string` | `"default"` | no |
| <a name="input_override_name"></a> [override\_name](#input\_override\_name) | Should the role name be only what is given in the `role_name`? If false, it consists of cluster name and namespace. | `bool` | `false` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Abbreviated role name if necessary | `string` | `""` | no |
| <a name="input_serviceaccount"></a> [serviceaccount](#input\_serviceaccount) | Kubernetes ServiceAccount that will use this role | `string` | n/a | yes |
| <a name="input_suffixed"></a> [suffixed](#input\_suffixed) | Should the role name be suffixed with random id to be unique? | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS Role tags | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of a created role |
| <a name="output_name"></a> [name](#output\_name) | Full name of a created role |

Disclaimer: this code is auto-generated with [tf-docs](https://terraform-docs.io) by macros
