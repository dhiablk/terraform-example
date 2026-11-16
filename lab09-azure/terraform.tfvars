location         = "eastus"
vnet_cidr_blocks = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
subnet_prefixes  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
nsg_names        = ["web", "app", "db"]
nsg_ports        = [80, 8080, 3306]
