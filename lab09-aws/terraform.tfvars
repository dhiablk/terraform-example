region             = "us-east-1"
subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
security_groups    = ["web", "app", "db"]
sg_ports           = [80, 8080, 3306]
