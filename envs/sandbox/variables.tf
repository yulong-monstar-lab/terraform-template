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
variable "APP_ENV" {
  type = string
}
variable "APP_PORT" {
  type = string
}
variable "DB_NAME" {
  type = string
}
variable "DB_PORT" {
  type = string
}
variable "DB_SSL" {
  type = string
}
variable "JWT_ACCESS_TOKEN_EXP_IN_SEC" {
  type = string
}
variable "JWT_REFRESH_TOKEN_EXP_IN_SEC" {
  type = string
}
variable "WEBSITES_ENABLE_APP_SERVICE_STORAGE" {
  type = string
}
variable "DEFAULT_ADMIN_USER_PASSWORD" {
  type = string
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

// Container Registry
variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type = string
}

variable "key_vault_id" {
  type = string
}


