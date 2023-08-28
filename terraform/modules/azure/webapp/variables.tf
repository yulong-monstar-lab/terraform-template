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
# variable "app_settings" {
#   type = map(string)
# }
variable "tags" {
  type = map(string)
}


variable "APP_ENV" {
  type = string
}
variable "APP_PORT" {
  type = string
}
variable "DB_HOST" {
  type = string
}
variable "DB_NAME" {
  type = string
}
variable "DB_USER" {
  type = string
}
variable "DB_PASS" {
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
variable "JWT_PRIVATE_KEY_BASE64" {
  type = string
}
variable "JWT_PUBLIC_KEY_BASE64" {
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


