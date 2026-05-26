output "tfstate_resource_group_name" {
  description = "Resource group containing the Terraform state backend."
  value       = module.bootstrap_shared_rg
}

output "tfstate_storage_account_name" {
  description = "Storage account used for Terraform remote state."
  value       = azurerm_storage_account.tfstate.name
}

output "tfstate_container_name" {
  description = "Blob container used for Terraform remote state."
  value       = azurerm_storage_container.tfstate.name
}

output "github_actions_client_id" {
  value       = azurerm_user_assigned_identity.github_actions_mid.client_id
  description = "Client ID used by GitHub Actions for Azure OIDC login."
}

output "github_actions_principal_id" {
  value       = azurerm_user_assigned_identity.github_actions_mid.principal_id
  description = "Principal ID used for Azure RBAC assignments."
}