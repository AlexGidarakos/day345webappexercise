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

# Define WebApp subnet
resource "azurerm_subnet" "subnet_wa" {
  name = local.subnet_wa_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_wa_cidr

  delegation {
    name = local.subnet_wa_delegation_name

    service_delegation {
      name = var.subnet_wa_service_delegation_name
      actions = var.subnet_wa_service_delegation_actions
    }
  }
}

# Define DB subnet
resource "azurerm_subnet" "subnet_db" {
  name = local.subnet_db_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_db_cidr
}

# Define Key Vault subnet
resource "azurerm_subnet" "subnet_kv" {
  name = local.subnet_kv_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_kv_cidr
}

# Define Service Plan
resource "azurerm_service_plan" "sp" {
  name = local.sp_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  os_type = var.sp_os
  sku_name = var.sp_sku
}
