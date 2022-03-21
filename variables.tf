variable "azure_new_resource_group" {

  type = map(string)
  default = {
    //TO DO: Get the id´s of the cariad azure account
    "subscription_id" = ""
    "client_id"       = ""
    "tenant_id"       = ""
    "client_secret"   = ""

  }
}
variable "azure_databricks_variables" {

  type = map(string)
  default = {

    //On the lukas module
    "location" = "westeurope"
    //On the lukas module
    "resource_group_name"     = "TerraformDatabricks"
    "databricks_service_name" = "databricks_test_service"
    "sku_piercing_tier"       = "standard"
    "name"                    = "db_name"

  }
}






/***  RESOURCE GROUP VARIABLES **/
variable "location" {
  description = "The location for all resources"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "The resource group that was provided"
  type        = string
}


