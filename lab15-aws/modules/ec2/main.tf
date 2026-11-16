resource "aws_security_group" "custom" {
  name        = "custom-sg-${var.environment}"
  description = "Custom module security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "custom-sg-${var.environment}"
    Environment = var.environment
    ManagedBy   = "custom-module"
  }
}

resource "aws_instance" "custom" {
  count         = 1
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.custom.id]

  tags = {
    Name        = "custom-ec2-${var.environment}"
    Environment = var.environment
    ManagedBy   = "custom-module"
  }
}

output "instance_id" {
  value = aws_instance.custom[*].id
}

output "instance_private_ip" {
  value = aws_instance.custom[*].private_ip
}

output "security_group_id" {
  value = aws_security_group.custom.id
}