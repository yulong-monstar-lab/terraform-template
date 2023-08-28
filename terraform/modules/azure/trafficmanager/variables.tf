// Resource group
variable "resource_group_name" {
  type = string
}

// Traffic manager
variable "traffic_manager_name" {
  type = string
}
variable "traffic_routing_method" {
  type = string
}
variable "monitor_config_protocol" {
  type = string
}
variable "monitor_config_port" {
  type = number
}
variable "endpoint_name" {
  type = string
}
variable "target_resource_id" {
  type = string
}
# variable "geo_mappings" {
#   type = list(string)
# }