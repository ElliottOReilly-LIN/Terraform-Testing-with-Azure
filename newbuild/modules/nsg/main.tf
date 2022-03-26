resource "azurerm_network_security_group" "nb-NSG" {
  name                  = "acceptanceTestSecurityGroup1"
  resource_group_name   = var.resource_group_name
  location              = var.location

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Testing"
  }
}