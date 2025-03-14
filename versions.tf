terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
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
