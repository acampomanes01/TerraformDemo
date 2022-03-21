resource "azurerm_resource_group" "rg" {

  name     = var.resource_group_name
  location = var.location

  tags = {
  }
}


resource "azurerm_databricks_workspace" "example" {
  name                = var.azure_databricks_variables["name"]
  resource_group_name = var.azure_databricks_variables["resource_group_name"]
  location            = var.azure_databricks_variables["location"]
  sku                 = var.azure_databricks_variables["sku_piercing_tier"]
}