terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

# resource "azurerm_resource_group" "webapp" {
#   location = var.resource_group_location
#   name     = var.resource_group_name
#   tags     = var.tags
# }

// TODO: create a Key Vault and secrets in it manually before run Terraform apply
// TODO: replace key_vault_id in terraform.tfvars
data "azurerm_key_vault_secret" "db_host" {
  name         = "DBHOST"
  key_vault_id = var.key_vault_id
}
data "azurerm_key_vault_secret" "db_user" {
  name         = "DBUSER"
  key_vault_id = var.key_vault_id
}
data "azurerm_key_vault_secret" "db_pass" {
  name         = "DBPASS"
  key_vault_id = var.key_vault_id
}
data "azurerm_key_vault_secret" "jwt_private_key" {
  name         = "JWT-PRIVATE-KEY-BASE64"
  key_vault_id = var.key_vault_id
}
data "azurerm_key_vault_secret" "jwt_public_key" {
  name         = "JWT-PUBLIC-KEY-BASE64"
  key_vault_id = var.key_vault_id
}

# Container Registry
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.acr_sku
  admin_enabled       = true
}

// Web app module, contains service plan and web app.
module "webapp" {
  source                  = "../../modules/azure/webapp"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  service_plan_name       = var.service_plan_name
  service_plan_os_type    = var.service_plan_os_type
  service_plan_sku_name   = var.service_plan_sku_name
  web_app_name            = var.web_app_name
  web_app_https_only      = var.web_app_https_only
  tags                    = var.tags
  APP_ENV = var.APP_ENV
  APP_PORT                            = var.APP_PORT
  DB_HOST                             = data.azurerm_key_vault_secret.db_host.value
  DB_NAME                             = var.DB_NAME
  DB_USER                             = data.azurerm_key_vault_secret.db_user.value
  DB_PASS                             = data.azurerm_key_vault_secret.db_pass.value
  DB_PORT                             = var.DB_PORT
  DB_SSL                              = var.DB_SSL
  JWT_ACCESS_TOKEN_EXP_IN_SEC         = var.JWT_ACCESS_TOKEN_EXP_IN_SEC
  JWT_PRIVATE_KEY_BASE64              = data.azurerm_key_vault_secret.jwt_private_key.value
  JWT_PUBLIC_KEY_BASE64               = data.azurerm_key_vault_secret.jwt_public_key.value
  JWT_REFRESH_TOKEN_EXP_IN_SEC        = var.JWT_REFRESH_TOKEN_EXP_IN_SEC
  WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.WEBSITES_ENABLE_APP_SERVICE_STORAGE
  DEFAULT_ADMIN_USER_PASSWORD = var.DEFAULT_ADMIN_USER_PASSWORD
}

// Network
module "networking" {
  source                            = "../../modules/azure/networking"
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
}

// dns
module "dns" {
  source                    = "../../modules/azure/dns"
  resource_group_name       = var.resource_group_name
  private_dns_zone_name     = var.private_dns_zone_name
  virtual_network_link_name = var.virtual_network_link_name
  virtual_network_id        = module.networking.virtual_network_id // Output of network module
}

// DB
module "database" {
  source                  = "../../modules/azure/database"
  db_name                 = var.db_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  db_version              = var.db_version
  db_storage_mb           = var.db_storage_mb
  db_sku_name             = var.db_sku_name
  db_login                = data.azurerm_key_vault_secret.db_user.value
  db_pwd                  = data.azurerm_key_vault_secret.db_pass.value
  db_zone                 = var.db_zone
  db_high_availability    = var.db_high_availability
  delegated_subnet_id     = module.networking.private_subnet_id // Output of network module
  private_dns_zone_id     = module.dns.private_dns_zone_id      // Output of network dns
  database_name           = var.database_name
  database_collation      = var.database_collation
  database_charset        = var.database_charset
  tags = var.tags
}

