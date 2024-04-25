terraform {
  backend "azurerm" {
    container_name = "stmediawiki-tfstate-0001"
    key            = "mediawiki-infra.tfstate"
  }
}
