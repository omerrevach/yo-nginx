variable "vpc_id" {}

variable "public_subnet_ids" {
  description = "List of public subnet id's for ALB"
  type        = list(string)
}

variable "acm_certificate_arn" {}

variable "ec2_instance_ids" {
  description = "Map of EC2 instance id's to register in the target group"
  type        = map(string)
}
