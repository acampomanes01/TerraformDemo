# cap-tf-module-azure-storage-account
Azure Databricks Service Module

# Use
This module is used to create an Azure Databricks Service.

## Variables

When using the module, you want to specify this variables on the "variables.tf" file:
- <a name="azure_new_resource_group"></a> [networking](#azure_new_resource_group): In this variable you must enter the necessary id to connect the terraform files with the Azure Databricks repository following this example:
EXAMPLE:
variable "azure_new_resource_group" {

  type = map(string)
  default = {

    "subscription_id" = "97675635-a370-4395-9a6a-b0f254ab6939"
    "client_id"       = "5c888ecd-bd0b-4802-a86a-7bcedace00a2"
    "tenant_id"       = "e521eae5-732f-472d-8068-beca0a5839fa"
    "client_secret"   = "I177Q~oXg~wJtWN5YVMSrS0R1W188XTSP43Ar"

  }
}
- <a name="location"></a> [location](#location): In this variable you must enter the location of the Azure resource
- <a name="resource_group_name"></a> [resource_group_name](#resource_group_name): In this variable you must enter the name of the Azure resource
- <a name="databricks_service_name"></a> [databricks_service_name](#databricks_service_name): In this variable you must enter the databricks service name.
- <a name="databricks_sku_pricing_tier"></a> [databricks_sku_pricing_tier](#databricks_sku_pricing_tier): In this variable you must enter the service's piercing tier. There are 3 options, the Trial (14 days free), the basic and the premium.

## Variables table

| Name                                                                                                | Description                                                                      | Type           | Default     | Required |
| ----------------------------------------------------------------------------------------------------| ---------------------------------------------------------------------------------| -------------- | ----------- | :------: |
| <a name="azure_new_resource_group"></a> [azure_new_resource_group](#azure_new_resource_group)       | necessary id to connect the terraform files with the Azure Databricks repository | `map`          |             |    yes   |
| <a name="location"></a> [location](#location)                                              		  | The location of the Azure resource                                               | `string`       | `westeurope`|    yes   |
| <a name="resource_group_name"></a> [resource_group_name](#resource_group_name)                      | The resource group name                                                          | `string`       | `TerraformDatabricks`|    yes   |
| <a name="databricks_service_name"></a> [databricks_service_name](#databricks_service_name)          | The databricks service name                                                      | `string`       | `databricks_test_service` |    yes    |
| <a name="databricks_sku_pricing_tier"></a> [databricks_sku_pricing_tier](#databricks_sku_pricing_tier)|In this variable you must enter the service's piercing tier. There are 3 options, the Trial (14 days free), the basic and the premium.| `string`| `trial`| no |

                                   | The connection string that is used for the data factory link                                           |