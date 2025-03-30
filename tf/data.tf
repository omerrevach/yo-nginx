data "aws_acm_certificate" "this" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
  most_recent = true
}

data "aws_vpc" "selected" {
  id = module.vpc.vpc_id
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.selected.id
}
