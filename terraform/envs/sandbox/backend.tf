terraform {
  backend "azurerm" {
    resource_group_name   = "cicd-test"
    storage_account_name  = "cicdtestyulong"
    container_name        = "mycontainer"
    key                   = "terraform.tfstate"
  }
}
