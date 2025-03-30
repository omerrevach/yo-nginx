variable "vpc_id" {}
variable "private_subnet_id" {}
variable "linux_ami" {}
variable "instance_type" {}
variable "alb_sg_id" {}
variable "instance_profile_name" {
  description = "IAM instance profile for ssm access"
  type        = string
}
