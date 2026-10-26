# General Variables (LAB-03)
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "France Central"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-lab04"
}

variable "vnet_cidr" {
  description = "CIDR block for VNet"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet Variables (LAB-04)
variable "web_subnet_cidr" {
  description = "CIDR block for web subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR block for app subnet"
  type        = string
  default     = "10.0.2.0/24"
}
