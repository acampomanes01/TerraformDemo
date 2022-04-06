//Azure subscription data
variable "azure_new_resource_group" {

  type = map(string)
  default = {

    "subscription_id" = "97675635-a370-4395-9a6a-b0f254ab6939"
    "client_id"       = "5c888ecd-bd0b-4802-a86a-7bcedace00a2"
    "tenant_id"       = "e521eae5-732f-472d-8068-beca0a5839fa"
    "client_secret"   = "I177Q~oXg~wJtWN5YVMSrS0R1W188XTSP43Ar"

  }
}
variable "azure_databricks_variables" {

  type = map(string)
  default = {

    //On the lukas module
    "location" = "westeurope"
    //On the lukas module
    "resource_group_name"     = "test-databricks-tf-intro-rg"
    "databricks_service_name" = "databricks_test_service"
    "sku_piercing_tier"       = "trial"
    "name"                    = "db_notebook"

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

  type = string

  default = "test-databricks-tf-intro-rg"
}

variable  "email_notifier" {
  description = "The email address to send job status to"
  type = list(string)
  default = ["acampomanes@deloitte.es"]

}

variable  "databricks_account_id" {
  type = string
  default = "97675635-a370-4395-9a6a-b0f254ab6939"

}


