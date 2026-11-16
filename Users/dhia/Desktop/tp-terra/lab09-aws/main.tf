resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "subnet" {
  for_each = {
    for i, cidr in var.subnet_cidr_blocks : "subnet-${i + 1}" => {
      cidr  = cidr
      az    = var.availability_zones[i]
      index = i
    }
  }
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "subnet-${each.value.index + 1}"
    Tier = each.value.index < 1 ? "public" : "private"
  }
}

resource "aws_security_group" "sg" {
  for_each    = toset(var.security_groups)
  name        = "${each.value}-sg"
  description = "Security group for ${each.value}"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${each.value}-sg"
  }
}

resource "aws_security_group_rule" "ingress" {
  for_each = {
    for i, port in var.sg_ports : "${var.security_groups[i]}-${port}" => {
      port = port
      sg   = var.security_groups[i]
    }
  }
  type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg[each.value.sg].id
}
