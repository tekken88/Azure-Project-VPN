# Local Network Gateway HUB 
resource "azurerm_local_network_gateway" "localgwhub" {
  name                = "HUB"
  resource_group_name = var.resource_group_name
  location            = azurerm_virtual_network.terraform_vnet_east.location
  gateway_address     = azurerm_public_ip.eastus-vpn-gateway-pip.ip_address
  address_space       = azurerm_virtual_network.terraform_vnet_east.address_space 
}

# Local Network Gateway ONSITE 
resource "azurerm_local_network_gateway" "localgwonsite" {
  name                = "ONSITE"
  resource_group_name = var.resource_group_name
  location            = azurerm_virtual_network.terraform_vnet_west.location
  gateway_address     = azurerm_public_ip.westus2-vpn-gateway-pip.ip_address
  address_space       = azurerm_virtual_network.terraform_vnet_west.address_space
}