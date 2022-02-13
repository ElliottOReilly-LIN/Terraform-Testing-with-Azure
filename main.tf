resource "azurerm_resource_group" "rs_grp" {
  name        = "${var.prefix}-rs_grp"
  location    = "West Europe"

  tags = {
  Owner       = "Elliott O'Reilly"
    }
}

resource "azurerm_virtual_network" "main_VPC" {
  // using a local variable her instead of the prefix for
  name                = "${local.setup_name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rs_grp.location
  resource_group_name = azurerm_resource_group.rs_grp.name
}

module "My Webserver" {
  source = "/modules/webserver"
}

## New line to test git diff
## Extra line 