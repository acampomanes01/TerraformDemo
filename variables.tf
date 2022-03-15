variable "azure_new_resource_group" {

  type = map(string)
  default = {

    "subscription_id" = "97675635-a370-4395-9a6a-b0f254ab6939"
    "client_id"       = "5c888ecd-bd0b-4802-a86a-7bcedace00a2"
    "tenant_id"       = "e521eae5-732f-472d-8068-beca0a5839fa"
    "client_secret"   = "I177Q~oXg~wJtWN5YVMSrS0R1W188XTSP43Ar"

  }
}

/*** DATABRICKS SERVICES VARIABLES **/

variable "location" {
  description = "The location for all resources"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "The resource group that was provided"
  type        = string
  default     = "TerraformDatabricks"
}

variable "databricks_service_name" {
  description = "The databricks service name that was provided"
  type        = string
  default     = "databricks_test_service"
}

variable "databricks_sku_pricing_tier" {
  description = "Pricing Tier for Databricks Service "
  type        = string
  default     = "trial"
}

