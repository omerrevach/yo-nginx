module "vpc" {
  source  = "./modules/vpc"

  vpc_name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway         = var.enable_nat_gateway
  single_nat_gateway         = var.single_nat_gateway
  one_nat_gateway_per_az     = var.one_nat_gateway_per_az

  environment            = var.environment
}

module "ec2" {
  source                = "./modules/ec2"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnet_ids
  linux_ami             = var.linux_ami
  instance_type         = var.instance_type
  alb_sg_id             = module.alb.alb_sg_id
  instance_profile_name = module.iam.instance_profile_name
  ecr_repo_url          = module.ecr.repository_url

  depends_on = [ module.ecr ]
}

module "vpc_endpoints" {
  source                = "./modules/vpc_endpoints"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnet_ids
  ec2_security_group_id = module.ec2.security_group_id
  region                = var.region
  name_prefix           = "ssm"
}


module "iam" {
  source       = "./modules/iam"
  ecr_repo_arn = module.ecr.repository_arn
}

module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  ec2_instance_ids    = module.ec2.instance_ids
  acm_certificate_arn = data.aws_acm_certificate.this.arn
}


module "route53" {
  source          = "./modules/route53"
  hosted_zone_id  = var.hosted_zone_id
  domain_name     = var.domain_name
  alb_dns_name    = module.alb.alb_dns_name
  alb_zone_id     = module.alb.alb_zone_id
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = "nginx-assignment"
}

