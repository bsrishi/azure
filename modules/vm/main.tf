resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.vm_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = "Standard_DS1_v2"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    network_interface_ids = [azurerm_network_interface.nic.id]
  }
}

# Associate the public IP with the NIC
resource "azurerm_public_ip_association" "nic_public_ip_association" {
  resource_group_name     = var.resource_group_name
  public_ip_address_id    = azurerm_public_ip.vm_public_ip.id
  network_interface_id    = azurerm_network_interface.nic.id
  ip_configuration_name   = azurerm_network_interface.nic.ip_configuration[0].name
}
