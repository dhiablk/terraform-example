resource "aws_vpc" "custom" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "custom-vpc-${var.environment}"
    Environment = var.environment
    ManagedBy   = "custom-module"
  }
}

resource "aws_subnet" "custom" {
  count             = 2
  vpc_id            = aws_vpc.custom.id
  cidr_block        = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
  availability_zone = element(var.region == "us-east-1" ? ["us-east-1a", "us-east-1b"] : ["us-west-2a", "us-west-2b"], count.index)

  tags = {
    Name        = "custom-subnet-${count.index + 1}-${var.environment}"
    Environment = var.environment
  }
}

output "vpc_id" {
  value = aws_vpc.custom.id
}

output "subnet_ids" {
  value = aws_subnet.custom[*].id
}