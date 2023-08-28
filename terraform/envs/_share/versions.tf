terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "komatsu-dx-app"
    storage_account_name  = "komatsustorageaccount"
    container_name        = "mycontainer"
    key                   = "terraform.tfstate"
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
