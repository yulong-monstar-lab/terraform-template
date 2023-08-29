terraform {
  backend "azurerm" {
    resource_group_name   = "komatsu-dx-app"
    storage_account_name  = "komatsustorageaccount"
    container_name        = "mycontainer"
    key                   = "terraform.tfstate"
  }
}
