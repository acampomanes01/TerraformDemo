resource "azurerm_resource_group" "rg" {

  name     = var.resource_group_name
  location = var.location

  tags = {

    "Topic"       = "Innovation"
    "Category"    = "Terraform"
    "SubCategory" = "Introduction"
    "Level"       = "Beginner"
  }
}


resource "azurerm_databricks_workspace" "example" {
  name                = var.databricks_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.databricks_sku_pricing_tier

  tags = {
    Environment = "Test"
    Autor        = "acampomanes"
  }


}