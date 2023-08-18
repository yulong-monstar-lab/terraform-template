
provider "azurerm" {
  features {}
}

# resource "azurerm_resource_group" "webapp" {
#   location = var.resource_group_location
#   name     = var.resource_group_name
#   tags     = var.tags
# }

// Web app module, contains service plan and web app.
module "webapp" {
  source                  = "../../modules/webapp"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  service_plan_name       = var.service_plan_name
  service_plan_os_type    = var.service_plan_os_type
  service_plan_sku_name   = var.service_plan_sku_name
  web_app_name            = var.web_app_name
  web_app_https_only      = var.web_app_https_only
  app_settings            = var.app_settings
  tags                    = var.tags
  # depends_on              = [azurerm_resource_group.webapp]
}

// Network
module "networking" {
  source                            = "../../modules/networking"
  resource_group_name               = var.resource_group_name
  resource_group_location           = var.resource_group_location
  virtual_network_name              = var.virtual_network_name
  virtual_network_address_space     = var.virtual_network_address_space
  protected_subnet_name             = var.protected_subnet_name
  protected_subnet_address_prefixes = var.protected_subnet_address_prefixes
  protected_subnet_nsg_name         = var.protected_subnet_nsg_name
  private_subnet_name               = var.private_subnet_name
  private_subnet_address_prefixes   = var.private_subnet_address_prefixes
  private_subnet_nsg_name           = var.private_subnet_nsg_name
  web_app_id                        = module.webapp.web_app_id // Output of webapp module
  tags                              = var.tags
  # depends_on                        = [azurerm_resource_group.webapp]
}

// dns
module "dns" {
  source                    = "../../modules/dns"
  resource_group_name       = var.resource_group_name
  private_dns_zone_name     = var.private_dns_zone_name
  virtual_network_link_name = var.virtual_network_link_name
  virtual_network_id        = module.networking.virtual_network_id // Output of network module
  # depends_on                = [azurerm_resource_group.webapp]
}

// DB
module "database" {
  source                  = "../../modules/database"
  db_name                 = var.db_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  db_version              = var.db_version
  db_storage_mb           = var.db_storage_mb
  db_sku_name             = var.db_sku_name
  db_login                = var.db_login
  db_pwd                  = var.db_pwd
  db_zone                 = var.db_zone
  db_high_availability    = var.db_high_availability
  delegated_subnet_id     = module.networking.private_subnet_id // Output of network module
  private_dns_zone_id     = module.dns.private_dns_zone_id      // Output of network dns
  database_name      = var.database_name
  database_collation = var.database_collation
  database_charset   = var.database_charset
  # depends_on = [azurerm_resource_group.webapp, module.dns.azurerm_private_dns_zone_virtual_network_link.private_dns_zone]
  # depends_on         = [module.dns]
  tags               = var.tags
}
