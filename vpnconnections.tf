# Virtual Network Gateway Connections
# HUB VNet to Onsite Vnet
resource "azurerm_virtual_network_gateway_connection" "az-hub-onprem" {
  name                            = "Hub-to-onsite"
  resource_group_name             = var.resource_group_name
  location                        = azurerm_virtual_network.terraform_vnet_east.location
  type                            = "IPsec"
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.eastus-HUB-vpn-gateway.id
  local_network_gateway_id        = azurerm_local_network_gateway.localgwonsite.id
  shared_key                      = var.vpn_psk
}


# Onsite VNet to Hub Vnet
resource "azurerm_virtual_network_gateway_connection" "az-onprem-hub" {
  name                            = "Onsite-to-Hub"
  resource_group_name             = var.resource_group_name
  location                        = azurerm_virtual_network.terraform_vnet_west.location
  type                            = "IPsec"
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.westus2-ONSITE-vpn-gateway.id
  local_network_gateway_id        = azurerm_local_network_gateway.localgwhub.id
  shared_key                      = var.vpn_psk
}