// Resource group
variable "resource_group_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}
// webapp module
// Service plan
variable "service_plan_name" {
  type = string
}
variable "service_plan_os_type" {
  type = string
}
variable "service_plan_sku_name" {
  type = string
}
variable "tags" {
  type = map(string)
}

// Web app
variable "web_app_name" {
  type = string
}
variable "web_app_https_only" {
  type = bool
}
variable "app_settings" {
  type = map(string)
}

// network module
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

// dns module
// Private DNS
variable "private_dns_zone_name" {
  type = string
}

variable "virtual_network_link_name" {
  type = string
}


// DB module
variable "db_name" {
  type = string
}

variable "db_version" {
  type = string
}

variable "db_storage_mb" {
  type = number
}

variable "db_sku_name" {
  type = string
}

variable "db_login" {
  type = string
}

variable "db_pwd" {
  type = string
}


variable "db_zone" {
  type = string
}


variable "db_high_availability" {
  type = map(string)
}

variable "database_name" {
  type = string
}


variable "database_collation" {
  type = string
}


variable "database_charset" {
  type = string
}