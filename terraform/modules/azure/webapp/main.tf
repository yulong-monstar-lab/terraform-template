// Service plan
resource "azurerm_service_plan" "webapp" {
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  name                = var.service_plan_name
  os_type             = var.service_plan_os_type
  sku_name            = var.service_plan_sku_name

  tags = var.tags
}

// Web app
resource "azurerm_linux_web_app" "webapp" {
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  https_only          = var.web_app_https_only
  name                = var.web_app_name
  service_plan_id     = azurerm_service_plan.webapp.id
  app_settings = {
    APP_ENV                             = var.APP_ENV
    APP_PORT                            = var.APP_PORT
    DB_HOST                             = var.DB_HOST
    DB_NAME                             = var.DB_NAME
    DB_USER                             = var.DB_USER
    DB_PASS                             = var.DB_PASS
    DB_PORT                             = var.DB_PORT
    DB_SSL                              = var.DB_SSL
    JWT_AUTHORITY                       = var.JWT_AUTHORITY
    JWT_AUDIENCE                        = var.JWT_AUDIENCE
    JWT_ISSUER                          = var.JWT_ISSUER
    JWT_ACCESS_TOKEN_EXP_IN_SEC         = var.JWT_ACCESS_TOKEN_EXP_IN_SEC
    JWT_PRIVATE_KEY_BASE64              = var.JWT_PRIVATE_KEY_BASE64
    JWT_PUBLIC_KEY_BASE64               = var.JWT_PUBLIC_KEY_BASE64
    JWT_REFRESH_TOKEN_EXP_IN_SEC        = var.JWT_REFRESH_TOKEN_EXP_IN_SEC
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = var.WEBSITES_ENABLE_APP_SERVICE_STORAGE
    DEFAULT_ADMIN_USER_PASSWORD         = var.DEFAULT_ADMIN_USER_PASSWORD
  }

  site_config {
    application_stack {
      docker_image_name   = "appsvc/staticsite:latest"
      docker_registry_url = "https://mcr.microsoft.com"
    }
  }
  depends_on = [
    azurerm_service_plan.webapp,
  ]
  tags = var.tags
}
