## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.50 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~>2.4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~>3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.50 |
| <a name="provider_local"></a> [local](#provider\_local) | ~>2.4 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~>3.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.password_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.user_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_secret.kv_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_resource_group.ssh_key_kv_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [local_sensitive_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_algorithm"></a> [algorithm](#input\_algorithm) | (Required) Name of the algorithm to use when generating the private key. Currently-supported values are RSA, ECDSA and ED25519. | `string` | n/a | yes |
| <a name="input_directory_permission"></a> [directory\_permission](#input\_directory\_permission) | (optional) Permissions to set for directories created (before umask), expressed as string in numeric notation. Default value is 0700 | `string` | `"700"` | no |
| <a name="input_ecdsa_curve"></a> [ecdsa\_curve](#input\_ecdsa\_curve) | (optional)  When algorithm is ECDSA, the name of the elliptic curve to use | `string` | `"P224"` | no |
| <a name="input_enable_az_key_vault_secret"></a> [enable\_az\_key\_vault\_secret](#input\_enable\_az\_key\_vault\_secret) | (Optional) Whether to push generated ssh private key to azure keyVault as secret. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | (optional)Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| <a name="input_expiration_date"></a> [expiration\_date](#input\_expiration\_date) | (optional) Expiration UTC datetime (2024-01-31T00:00:00Z) | `string` | `"2024-01-31T00:00:00Z"` | no |
| <a name="input_file_permission"></a> [file\_permission](#input\_file\_permission) | (optional) Permissions to set for the output file (before umask), expressed as string in numeric notation. Default value is 0700 | `string` | `"700"` | no |
| <a name="input_location"></a> [location](#input\_location) | (optional) The location of resource group in which Key vault and associated resources are created | `string` | `"westeurope"` | no |
| <a name="input_private_key_filename"></a> [private\_key\_filename](#input\_private\_key\_filename) | (optional) Filename for private key saved locally on machine with path | `string` | `"./private_ssh_key"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | (optional) Is Purge Protection enabled for this Key Vault? | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (optional) Resource group in which Key vault and respective resources would be created | `string` | `"kv-auto-ssh-ppk-key"` | no |
| <a name="input_rsa_bits"></a> [rsa\_bits](#input\_rsa\_bits) | (optional)When algorithm is RSA, the size of the generated RSA key, in bits | `number` | `4096` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | (optional) he number of days that items should be retained for once soft-deleted. | `number` | `7` | no |
| <a name="input_ssh_key_vault_name"></a> [ssh\_key\_vault\_name](#input\_ssh\_key\_vault\_name) | (optional) Key Vault name where private key would be stored as password | `string` | `"kv-ssh-key-module"` | no |
| <a name="input_ssh_kv_secret"></a> [ssh\_kv\_secret](#input\_ssh\_kv\_secret) | (optional) KV secret which contains the ssh ppk | `string` | `"secret-ssh-ppk-module"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (optional) Tags atttached with the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ssh_key"></a> [public\_ssh\_key](#output\_public\_ssh\_key) | n/a |
| <a name="output_public_ssh_key_pem"></a> [public\_ssh\_key\_pem](#output\_public\_ssh\_key\_pem) | n/a |
