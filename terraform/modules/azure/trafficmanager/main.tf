resource "azurerm_traffic_manager_profile" "webapp" {
  name                   = var.traffic_manager_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method

  dns_config {
    relative_name = var.traffic_manager_name
    ttl           = 100
  }

  monitor_config {
    protocol                     = var.monitor_config_protocol
    port                         = var.monitor_config_port
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "webapp" {
  name               = var.endpoint_name
  profile_id         = azurerm_traffic_manager_profile.webapp.id
  weight             = 100
  target_resource_id = var.target_resource_id
  // See: GeoCode in https://learn.microsoft.com/en-us/azure/backup/scripts/geo-code-list
#   geo_mappings = ["jpe", "jpw"]
}