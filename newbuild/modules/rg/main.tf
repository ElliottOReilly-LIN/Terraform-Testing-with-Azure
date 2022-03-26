resource "azurerm_resource_group" "baseRG" {
  name = var.resource_group_name
  location = var.location
}