variable "vpc_id" {}

variable "public_subnet_ids" {
  description = "List of public subnet id's for ALB"
  type        = list(string)
}

variable "acm_certificate_arn" {}

variable "ec2_instance_ids" {
  type = list(string)
}
