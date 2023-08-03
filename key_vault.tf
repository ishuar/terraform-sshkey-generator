data "azurerm_client_config" "current" {
}
resource "azurerm_resource_group" "ssh_key_kv_rg" {
  count    = var.enable_az_key_vault_secret ? 1 : 0
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
#tfsec:ignore:azure-keyvault-specify-network-acl
resource "azurerm_key_vault" "password_key_vault" {
  count                       = var.enable_az_key_vault_secret ? 1 : 0
  name                        = var.ssh_key_vault_name
  location                    = azurerm_resource_group.ssh_key_kv_rg[0].location
  resource_group_name         = azurerm_resource_group.ssh_key_kv_rg[0].name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled #tfsec:ignore:azure-keyvault-no-purge
  sku_name                    = "standard"
  tags                        = var.tags
}
resource "azurerm_key_vault_access_policy" "user_access_policy" {
  count        = var.enable_az_key_vault_secret ? 1 : 0
  key_vault_id = azurerm_key_vault.password_key_vault[0].id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Set",
    "Get",
    "Delete",
    "Purge",
    "Recover",
    "List",
  ]
}
resource "azurerm_key_vault_secret" "kv_secret" {
  count           = var.enable_az_key_vault_secret ? 1 : 0
  name            = var.ssh_kv_secret
  value           = tls_private_key.ssh.private_key_pem
  key_vault_id    = azurerm_key_vault.password_key_vault[0].id
  content_type    = "ssh-key"
  expiration_date = var.expiration_date
  tags            = var.tags
  depends_on = [
    azurerm_key_vault_access_policy.user_access_policy
  ]
}

# ref: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment
# resource "azurerm_role_assignment" "this" {
#   count                = var.enable_rbac_authorization == true && var.rbac_authorization_role != null ? 1 : 0
#   principal_id         = data.azurerm_client_config.current.object_id
#   role_definition_name = var.rbac_authorization_role
#   scope                = azurerm_key_vault.password_key_vault[0].id
# }
