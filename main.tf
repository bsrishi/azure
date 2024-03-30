resource "azurerm_resource_group" "rg" {
  name     = "farmhost"
  location = "East US"
}

module "azure_vnet" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = "farmhost-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "farmhost-subnet"
  subnet_prefix       = "10.0.1.0/24"
}

module "azure_vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = "myVM"
  admin_username      = "adminuser"
  subnet_id           = module.azure_vnet.subnet_id
}
