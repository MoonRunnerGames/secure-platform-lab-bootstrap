resource "azurerm_user_assigned_identity" "github_actions_dev" {
  name                = "uami-secureplatform-lab-dev-github"
  location            = azurerm_resource_group.bootstrap_shared.location
  resource_group_name = azurerm_resource_group.bootstrap_shared.name
}

resource "azurerm_federated_identity_credential" "github_actions_main" {
  name                = "fc-secureplatform-lab-main"
  resource_group_name = azurerm_resource_group.bootstrap_shared.name
  parent_id           = azurerm_user_assigned_identity.github_actions_dev.id

  audience = [
    "api://AzureADTokenExchange"
  ]

  issuer  = "https://token.actions.githubusercontent.com"
  subject = "repo:${local.github_owner}/${local.github_repo}:ref:refs/heads/main"
}