resource "azurerm_resource_group" "main" {
  name     = "primary-resources"
  location = var.location

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_virtual_network" "vnet_for_each" {
  for_each = {
    for i, cidr in var.vnet_cidr_blocks : "vnet-${i + 1}" => {
      cidr  = cidr
      index = i
    }
  }
  name                = each.key
  address_space       = [each.value.cidr]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    Environment = "Development"
    Network     = "Network-${each.value.index + 1}"
  }
}

resource "azurerm_subnet" "subnet_for_each" {
  for_each = {
    for i, prefix in var.subnet_prefixes : "subnet-${i + 1}" => {
      prefix = prefix
      index  = i
    }
  }
  name                 = each.key
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet_for_each["vnet-1"].name
  address_prefixes     = [each.value.prefix]
}

resource "azurerm_network_security_group" "nsg_for_each" {
  for_each = {
    for i, name in var.nsg_names : "${name}-nsg" => {
      port  = var.nsg_ports[i]
      index = i
    }
  }
  name                = each.key
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "rule-${each.value.index + 1}"
    priority                   = 100 + each.value.index
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = tostring(each.value.port)
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = "Development"
    Type        = "NSG-${each.value.index + 1}"
  }
}
