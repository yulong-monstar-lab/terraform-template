// Resource group
variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

// DB
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

// Output of network module
variable "delegated_subnet_id" {
  type = string
}

// Output of dns module
variable "private_dns_zone_id" {
  type = string
}

variable "tags" {
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


