### EASTUS HUB VPNGW
resource "azurerm_public_ip" "eastus-vpn-gateway-pip" {
    name                = "eastus-vpn-gateway-pip"
    location            = "eastus"
    resource_group_name = var.resource_group_name
    sku                 = "Standard"
    allocation_method   = "Static" 
}

resource "azurerm_virtual_network_gateway" "eastus-HUB-vpn-gateway" {
    name                = "eastus-HUB-vpn-gateway"
    location            = "eastus"
    resource_group_name = var.resource_group_name
    type                = "Vpn"
    vpn_type            = "RouteBased"
    active_active       = false
    enable_bgp          = false
    sku                 = "VpnGw1"
    generation          = "Generation1"

    ip_configuration {
    name                          = "eastvnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.eastus-vpn-gateway-pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet_east.id
    }
    depends_on = [azurerm_public_ip.eastus-vpn-gateway-pip]
}

##########################################################################################################
### WESTUS2 HUB VPNGW
resource "azurerm_public_ip" "westus2-vpn-gateway-pip" {
    name                = "westus2-vpn-gateway-pip"
    location            = "West US 2"
    sku                 = "Standard"
    resource_group_name = var.resource_group_name
    allocation_method   = "Static" 
}

resource "azurerm_virtual_network_gateway" "westus2-ONSITE-vpn-gateway" {
    name                = "westus2-ONSITE-vpn-gateway"
    location            = "West US 2"
    resource_group_name = var.resource_group_name
    type                = "Vpn"
    vpn_type            = "RouteBased"
    active_active       = false
    enable_bgp          = false
    sku                 = "VpnGw1"
    generation          = "Generation1"

    ip_configuration {
    name                          = "west2vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.westus2-vpn-gateway-pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet_west.id
    }
    depends_on = [azurerm_public_ip.westus2-vpn-gateway-pip]
}
