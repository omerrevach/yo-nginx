variable "vpc_id" {}

variable "subnet_ids" {
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "The security group id used by the ec2 instance"
  type        = string
}

variable "region" {}

variable "name_prefix" {
  description = "prefix name for naming"
  type        = string
}
