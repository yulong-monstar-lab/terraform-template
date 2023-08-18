// Service plan
variable "resource_group_location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "service_plan_name" {
  type = string
}
variable "service_plan_os_type" {
  type = string
}
variable "service_plan_sku_name" {
  type = string
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
variable "tags" {
  type = map(string)
}

