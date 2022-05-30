terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.99"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>3.4"
    }
  }
}
