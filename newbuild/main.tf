# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source              = "hashicorp/azurerm"
      version             = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id         = "5854f3c1-b805-4697-9b47-9d7a9ff1e517"
  tenant_id               = "79f0dd1b-7a27-4f5d-bdeb-8d87b24bd195"
}

module "resource_group" {
    source                = "./modules/rg"
    resource_group_name   = "newbuild-rg"
    location              = "uksouth"

}

module "NSG" {
    source                = "./modules/nsg"
    resource_group_name   =  module.resource_group.rgname
    location              = module.resource_group.rglocation
}