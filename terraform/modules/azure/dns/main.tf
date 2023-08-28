# DNS zone
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

// DNS zone, VNet binding
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone" {
  name                  = var.virtual_network_link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = var.virtual_network_id
  registration_enabled  = true
}