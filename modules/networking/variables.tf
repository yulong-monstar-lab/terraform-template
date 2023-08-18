// Resource group
variable "resource_group_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}

// Virtual network
variable "virtual_network_name" {
  type = string
}
variable "virtual_network_address_space" {
  type = list(string)
}

// Protected subnet
variable "protected_subnet_name" {
  type = string
}
variable "protected_subnet_address_prefixes" {
  type = list(string)
}

// Network Security Group
variable "protected_subnet_nsg_name" {
  type = string
}

// Private subnet
variable "private_subnet_name" {
  type = string
}
variable "private_subnet_address_prefixes" {
  type = list(string)
}

// Network Security Group
variable "private_subnet_nsg_name" {
  type = string
}

// Web app
variable "web_app_id" {
  type = string
}

variable "tags" {
  type = map(string)
}