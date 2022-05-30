###############
##Tls Key####
###############
variable "algorithm" {
  type        = string
  description = "(Required) Name of the algorithm to use when generating the private key. Currently-supported values are RSA, ECDSA and ED25519."
}
variable "ecdsa_curve" {
  type        = string
  description = "(optional)  When algorithm is ECDSA, the name of the elliptic curve to use"
  default     = "P224"
}
variable "rsa_bits" {
  type        = number
  description = "(optional)When algorithm is RSA, the size of the generated RSA key, in bits"
  default     = 4096
}
variable "private_key_filename" {
  type        = string
  description = "(optional) Filename for private key saved locally on machine with path"
  default     = "./private_ssh_key"
}

###############
###Az KeyVault##
###############

variable "enable_az_key_vault_secret" {
  type        = bool
  description = "(Optional) Whether to push generated ssh private key to azure keyVault as secret."
  default     = false
}
variable "resource_group_name" {
  type        = string
  description = "(optional) Resource group in which Key vault and respective resources would be created"
  default     = "kv-auto-ssh-ppk-key"
}
variable "location" {
  type        = string
  description = "(optional) The location of resource group in which Key vault and associated resources are created"
  default     = "westeurope"
}
variable "tags" {
  type        = map(string)
  description = "(optional) Tags atttached with the resources"
  default     = {}
}
variable "ssh_key_vault_name" {
  type        = string
  description = "(optional) Key Vault name where private key would be stored as password"
  default     = "kv-ssh-key-module"
}
variable "enabled_for_disk_encryption" {
  type        = bool
  description = "(optional)Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = false
}
variable "soft_delete_retention_days" {
  type        = number
  description = "(optional) he number of days that items should be retained for once soft-deleted."
  default     = 7
}
variable "purge_protection_enabled" {
  type        = bool
  description = "(optional) Is Purge Protection enabled for this Key Vault?"
  default     = false
}
variable "expiration_date" {
  type        = string
  description = "(optional) Expiration UTC datetime (2024-01-31T00:00:00Z)"
  default     = "2024-01-31T00:00:00Z"
}
variable "ssh_kv_secret" {
  type        = string
  description = "(optional) KV secret which contains the ssh ppk generated for aks module"
  default     = "secret-ssh-ppk-module"
}
