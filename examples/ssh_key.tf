## Minimal Example with AZ Key Vault Secret
##  !! Set resource_group_name for over-riding the RG for KV !!

module "rsa_ssh_key_pair" {
  source                     = "../"
  algorithm                  = "RSA"
  enable_az_key_vault_secret = false
}
