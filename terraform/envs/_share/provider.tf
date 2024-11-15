provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "7420cee8-c116-4416-a874-9d556e6fd400"
}
provider "azapi" {
  features {}
}

