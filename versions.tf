terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    version = "2.99.0" }
    databricks = {
      source = "databrickslabs/databricks"
    }
  }

}
provider "azurerm" {

  features {}
  tenant_id = var.azure_new_resource_group["tenant_id"]

  subscription_id = var.azure_new_resource_group["subscription_id"]

  client_id = var.azure_new_resource_group["client_id"]

  client_secret = var.azure_new_resource_group["client_secret"]

}

provider "databricks" {
  host = azurerm_databricks_workspace.example.workspace_url
  token = "dapi4c11f8657bdc3d920f71e6fc0afb597a-2"
}
