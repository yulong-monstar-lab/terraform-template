// Service plan
resource "azurerm_service_plan" "webapp" {
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  name                = var.service_plan_name
  os_type             = var.service_plan_os_type
  sku_name            = var.service_plan_sku_name
  
  tags                = var.tags
}

// Web app
resource "azurerm_linux_web_app" "webapp" {
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  app_settings        = var.app_settings
  https_only          = var.web_app_https_only
  name                = var.web_app_name
  service_plan_id     = azurerm_service_plan.webapp.id
  
  site_config {
    application_stack {
      docker_image_name     = "appsvc/staticsite:latest"
      docker_registry_url   = "https://mcr.microsoft.com"
    }
  }
  depends_on = [
    azurerm_service_plan.webapp,
  ]
  tags = var.tags
}
