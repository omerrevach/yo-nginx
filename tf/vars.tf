# vpc
variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "enable_nat_gateway" {
  type = bool
}

variable "single_nat_gateway" {
  type = bool
}

variable "one_nat_gateway_per_az" {
  type = bool
}

variable "environment" {
  type = string
}

# ec2
variable "linux_ami" {
  type        = string
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

# alb
# variable "alb_name_prefix" {
#   type        = string
#   description = "Prefix for ALB resource names"
# }

# route53
variable "hosted_zone_id" {
  type        = string
  description = "Route53 Hosted Zone ID"
}

variable "domain_name" {
  type        = string
  description = "Domain name to point to alb"
}



# vpc endpoint
variable "region" {}
