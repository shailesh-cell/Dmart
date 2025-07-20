resource "azurerm_resource_group" "main" {
  name     = "${var.product}-${var.environment}-${var.purpose}-rg-${var.region_short}-${var.instance_number}"
  location = "East US"  # You can also make this dynamic if needed
}
