terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.64.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.38.0"
    }
    msgraph = {
      source  = "hashicorp/microsoft"
      version = ">= 1.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

provider "msgraph" {}