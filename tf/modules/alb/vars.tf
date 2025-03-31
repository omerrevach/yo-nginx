variable "vpc_id" {}

variable "public_subnet_ids" {
  type        = list(string)
}

variable "acm_certificate_arn" {}
