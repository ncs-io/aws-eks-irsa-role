variable "namespace" {
  type        = string
  default     = "default"
  description = "Namespace of the ServiceAccount"
}

variable "serviceaccount" {
  type        = string
  description = "Kubernetes ServiceAccount that will use this role"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "AWS Role tags"
}

variable "role_name" {
  type        = string
  default     = ""
  description = "Abbreviated role name if necessary"
}

variable "suffixed" {
  type        = bool
  default     = false
  description = "Should the role name be suffixed with random id to be unique?"
}

variable "override_name" {
  type        = bool
  default     = false
  description = "Should the role name be only what is given in the `role_name`? If false, it consists of cluster name and namespace."
}

variable "description" {
  type        = string
  default     = null
  description = "description"
  # always wanted to write a line like above :P
}