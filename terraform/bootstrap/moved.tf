
# This can be deleted after being deployed once to all affected envs.

moved {
  from = azurerm_resource_group.tfstate
  to   = azurerm_resource_group.bootstrap_shared
}
moved {
  from = azurerm_user_assigned_identity.github_actions_dev
  to   = azurerm_user_assigned_identity.github_actions_mid
}

moved {
  from = azurerm_resource_group.bootstrap_shared
  to   = module.bootstrap_shared_rg.azurerm_resource_group.this
}