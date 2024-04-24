###VM in HUB Public Subnet East US
resource "azurerm_public_ip" "eastus_public_ip" {
    name                = "east-uspublic-HUB-1-pip"
    location            = "eastus"
    resource_group_name = var.resource_group_name
    sku                 = "Standard"
    allocation_method   = "Static" 
}

resource "azurerm_network_interface" "eastus_public" {
  name                = "eastus-vm-HUB-1-nic"
  location            = "East Us"
  resource_group_name = var.resource_group_name
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = "public-eastus-HUB-1-VM"
    subnet_id                     = azurerm_subnet.public_subnet_east_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.eastus_public_ip.id
    
  }
}

resource "azurerm_windows_virtual_machine" "eastus_public" {
  name                = "HUB-1"
  resource_group_name = var.resource_group_name
  location            = "East Us"
  size                = "Standard_Ds1_v2"
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.eastus_public.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}



####VM in Onsite Public Subnet West US 2
resource "azurerm_public_ip" "westus2_public_ip" {
    name                = "westus2-uspublic-ONSITE-1-pip"
    location            = "West US 2"
    resource_group_name = var.resource_group_name
    sku                 = "Standard"
    allocation_method   = "Static" 
}

resource "azurerm_network_interface" "westus2_public" {
  name                = "westus2-vm-ONSITE-1-nic"
  location            = "West US 2"
  resource_group_name = var.resource_group_name
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = "public-westus2-ONSITE-1-VM"
    subnet_id                     = azurerm_subnet.public_subnet_west_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.westus2_public_ip.id
    
  }
}

resource "azurerm_windows_virtual_machine" "westus2_public" {
  name                = "ONSITE-1"
  resource_group_name = var.resource_group_name
  location            = "West US 2"
  size                = "Standard_Ds1_v2"
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.westus2_public.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}