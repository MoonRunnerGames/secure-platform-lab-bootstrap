module "bootstrap_shared_rg" {
  source = "./modules/resource_group"

  name     = "rg-${local.name_prefix}-tfstate"
  location = var.location

  tags = local.common_tags
}

module "dev_rg" {
  source = "./modules/resource_group"

  name     = "rg-${var.project_name}-dev"
  location = var.location

  tags = merge(local.common_tags, {
    environment = "dev"
    purpose     = "application-infrastructure"
  })
}

resource "azurerm_storage_account" "tfstate" {
  name                     = local.storage_account_name
  resource_group_name      = module.bootstrap_shared_rg.name
  location                 = module.bootstrap_shared_rg.location
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

