resource "azurerm_resource_group" "bootstrap_shared" {
  name     = "rg-${local.name_prefix}-tfstate"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "tfstate" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.bootstrap_shared.name
  location                 = azurerm_resource_group.bootstrap_shared.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false

  tags = local.common_tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}

