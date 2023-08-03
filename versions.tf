terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.50"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>3.4"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.4"
    }
  }
}
