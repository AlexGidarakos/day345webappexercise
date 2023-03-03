# Define Resource Group
resource "azurerm_resource_group" "rg" {
  name = local.rg_name
  location = var.rg_location
}
