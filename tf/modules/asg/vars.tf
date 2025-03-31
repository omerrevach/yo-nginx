variable "vpc_id" {}

variable "subnet_ids" {
  type        = list(string)
}

variable "alb_sg_id" {}

variable "linux_ami" {}

variable "instance_type" {}

variable "instance_profile_name" {}

variable "ecr_repo_url" {}

variable "alb_target_group_arn" {}
