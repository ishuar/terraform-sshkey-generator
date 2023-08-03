## Minimal Example without AZ Key Vault Secret
##  !! Set resource_group_name for over-riding the RG for KV !!

module "rsa_ssh_key_pair" {
  source                     = "../"
  algorithm                  = "RSA"
  enable_az_key_vault_secret = false
  private_key_filename       = "ssh_keys/my-prv-key"
  file_permission            = "600"
}
