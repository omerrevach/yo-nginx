output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "nat_gateway_ids" {
  value = module.vpc.natgw_ids
}

output "availability_zones" {
  value = module.vpc.azs
}
