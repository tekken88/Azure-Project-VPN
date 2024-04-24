#### EAST HUB VNET Peerings ####
#### Create Peering East HUB to Central Spoke 
resource "azurerm_virtual_network_peering" "hubest-spokecn-peer" {
    name                      = "easthub-centralspoke-peer"
    resource_group_name       = var.resource_group_name
    virtual_network_name      = azurerm_virtual_network.terraform_vnet_east.name
    remote_virtual_network_id = azurerm_virtual_network.terraform_vnet_central.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = true
    use_remote_gateways       = false
}

##########################################################################################################
#### SPOKE VNET Peerings ####
#### Create Peering Central Spoke to East HUB ####
resource "azurerm_virtual_network_peering" "spokecn-hubest-peer" {
    name                      = "centralspoke-easthub-peer"
    resource_group_name       = var.resource_group_name
    virtual_network_name      = azurerm_virtual_network.terraform_vnet_central.name
    remote_virtual_network_id = azurerm_virtual_network.terraform_vnet_east.id
    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit   = false
    use_remote_gateways     = true
}

