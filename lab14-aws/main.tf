module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway   = false
  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}

locals {
  bucket_names = { for name, desc in var.s3_buckets : name => "${var.environment}-${name}-bucket" }
}

resource "aws_s3_bucket" "buckets" {
  for_each = local.bucket_names
  bucket   = each.value

  tags = {
    Name        = each.key
    Description = var.s3_buckets[each.key]
    Environment = var.environment
    ManagedBy   = "terraform-registry-module"
  }
}