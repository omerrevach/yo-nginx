variable "name_prefix" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "ec2_instance_id" {}
variable "acm_certificate_arn" {}
