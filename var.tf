variable "resource_group_name" {
    description = "Enter Target Resource Group Name"   
}

variable "vm_admin_username" {
    description = "User name to use as the admin account on the VMs"  
}

variable "vm_admin_password" {
    description = "Default password for admin account"
}

variable "vpn_psk" {
    description = "PSK for VPN Gateways"
}