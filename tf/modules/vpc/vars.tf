variable "vpc_name" {}
variable "cidr" {}
variable "azs" {}
variable "private_subnets" {}
variable "public_subnets" {}
variable "enable_nat_gateway" {
    description = "enable nat gateway (true / false)"
    default = true
    type = bool
}
variable "single_nat_gateway" {
    description = "one nat gateway (true / false)"
    default = true
    type = bool
}
variable "one_nat_gateway_per_az" {
    description = "if you want a nat gateway for every az (true / false)"
    default = false
    type = bool
}
variable "environment" {
    description = "prod, dev"
    type = string
}

