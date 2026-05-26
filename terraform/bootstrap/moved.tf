
# This can be deleted after being deployed once to all affected envs.
moved {
  from = azurerm_resource_group.tfstate
  to   = azurerm_resource_group.bootstrap_shared
}