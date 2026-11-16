output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.main.id
}

output "vnet_ids" {
  description = "The IDs of the virtual networks"
  value       = azurerm_virtual_network.vnet_for_each[*].id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = azurerm_subnet.subnet_for_each[*].id
}

output "nsg_ids" {
  description = "The IDs of the network security groups"
  value       = azurerm_network_security_group.nsg_for_each[*].id
}
