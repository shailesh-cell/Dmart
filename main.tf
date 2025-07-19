resource "azurerm_resource_group" "dmart" {
  name     = var.resource_group_name
  location = var.location
}
