variable "vpc_id" {}
variable "subnet_ids" {
  description = "List of private subnets (1 per AZ)"
  type        = list(string)
}
variable "linux_ami" {}
variable "instance_type" {}
variable "alb_sg_id" {}
variable "instance_profile_name" {}
