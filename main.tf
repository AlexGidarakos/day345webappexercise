# Define Resource Group
resource "azurerm_resource_group" "rg" {
  name = local.rg_name
  location = var.rg_location
}

# Define Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name = local.vnet_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space = var.vnet_cidr
}
