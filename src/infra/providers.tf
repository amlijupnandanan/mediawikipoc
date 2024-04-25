terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.94.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "cfa56b4d-9ab3-4006-a8dd-693d6517161f"
  features {}
}
