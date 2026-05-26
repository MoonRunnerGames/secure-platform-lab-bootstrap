resource "azurerm_user_assigned_identity" "github_actions_mid" {
  name                = "uami-secureplatform-lab-dev-github"
  location            = module.bootstrap_shared_rg.location
  resource_group_name = module.bootstrap_shared_rg.name
}

resource "azurerm_federated_identity_credential" "github_actions" {
  name                      = "fc-secureplatform-lab-main"
  user_assigned_identity_id = azurerm_user_assigned_identity.github_actions_mid.id

  audience = [
    "api://AzureADTokenExchange"
  ]

  issuer  = "https://token.actions.githubusercontent.com"
  subject = "repo:MoonRunnerGames@42037568/secure-platform-lab-infra@1244475075:ref:refs/heads/main"
}

resource "azurerm_role_assignment" "storage_contributor" {
  scope                = azurerm_storage_account.tfstate.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.github_actions_mid.principal_id
}

resource "azurerm_role_assignment" "dev_rg_contributor" {
  scope                = module.dev_rg.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.github_actions_mid.principal_id
}
