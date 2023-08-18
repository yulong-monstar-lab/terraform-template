
// PostgreSQL DB
resource "azurerm_postgresql_flexible_server" "db" {
  name                   = var.db_name
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  version                = var.db_version
  storage_mb             = var.db_storage_mb
  sku_name               = var.db_sku_name
  administrator_login    = var.db_login
  administrator_password = var.db_pwd
  zone                   = var.db_zone

  high_availability {
    mode                      = var.db_high_availability.mode
    standby_availability_zone = var.db_high_availability.standby_availability_zone
  }

  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  tags = var.tags
}

# Database in the PostgreSQL DB
resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.db.id
  collation = var.database_collation
  charset   = var.database_charset
}
