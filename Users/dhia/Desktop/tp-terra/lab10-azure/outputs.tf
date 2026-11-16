output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.example.id
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.example.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.example.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.example.id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}