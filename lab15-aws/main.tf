module "custom_vpc" {
  source = "./modules/vpc"

  vpc_cidr    = var.vpc_cidr
  region      = var.region
  environment = var.environment
}

module "custom_ec2" {
  source = "./modules/ec2"

  vpc_id        = module.custom_vpc.vpc_id
  subnet_ids    = module.custom_vpc.subnet_ids
  environment   = var.environment
  instance_type = var.instance_type
  ami_id        = var.ami_id
}