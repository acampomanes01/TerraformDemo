terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    version = "2.99.0" }
  }

}
provider "azurerm" {

  tenant_id       = var.azure_new_resource_group["tenant_id"]
  subscription_id = var.azure_new_resource_group["subscription_id"]
  client_id       = var.azure_new_resource_group["client_id"]
  client_secret   = var.azure_new_resource_group["client_secret"]

  features {}

  # The Azure subscription to target terraform to. Its declared in variables.tf and override values can be supplied via env-specific tfvars file
  #subscription_id = var.target_azure_subscription

  # comment out the following three lines when using the azure cli context for authentication. Please refer to README
  # client_id     = var.azure_target_subscription_credentials.client_id
  # client_secret = var.azure_target_subscription_credentials.client_secret
  # tenant_id     = var.azure_target_subscription_credentials.tenant_id
}
