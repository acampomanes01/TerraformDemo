# cap-tf-module-azure-storage-account
Azure Databricks Service Module

# Use
This module is used to create an Azure Databricks Service.

## Variables

When using the module, you want to specify:

- <a name="input_resource_group"></a> [resource_group](#input_resource_group)
- <a name="input_networking"></a> [networking](#input_networking): The default value of the variable `networking` is an empty map. This means that no network rules will be applied to the storage account. But if you want to specifiy network rules, you should provide a map with `subnet_ids`, `default_action`, `ip_rules` as in the following example.
EXAMPLE:
{
  "network" = {
    "subnet_ids" = [""]
    "default_action" = "Deny"
    "ip_rules" = ["100.0.0.1"]
  }
}

## Network Rules

The storage account has a dynamic block `network_rules`. By using the `for_each` expression, we simulate an if-statement. If the variable `networking` is empty, then no network rules will be assigned to the storage account. Otherwise, if the variable `networking` provides the needed `subnet_ids`, `default_action`, `ip_rules`, these will be assigned to the storage account.

# Module Spec

## Inputs

| Name                                                                           | Description                                                                                           | Type           | Default     | Required |
| ------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------- | -------------- | ----------- | :------: |
| <a name="input_name"></a> [name](#input_name)                                              | The name for the storage account                                                                                               | `string`       | `sacariadtest`        |    no    |
| <a name="input_location"></a> [location](#input_location)                                              | The location for all resources                                                                                               | `string`       | `westeurope`        |    no    |
| <a name="input_resource_group"></a> [resource_group](#input_resource_group)                                              | The resource group that was provided                                                                                               | `string`       | n/a        |    yes    |
| <a name="input_resource_tags"></a> [resource_tags](#input_resource_tags)                                              | Map of Default Tags                                                                                               | `map(any)`       | `{"tag" = ""}`        |    no    |
| <a name="input_account_tier"></a> [account_tier](#input_account_tier)                                              | The account tier                                                                                               | `string`       | `Standard`        |    no    |
| <a name="input_account_replication_type"></a> [account_replication_type](#input_account_replication_type)                                              | The account replication type                                                                                               | `string`       | `LRS`        |    no    |
| <a name="input_networking"></a> [networking](#input_networking)                                              | Map of network rules - empty if no network rules should be provided, otherwise provide a map with subnet_ids, default_action, ip_rules                                         | `set(map(map(string)))`       | `[]`        |    no    |

## Outputs

| Name                                                                                | Description                                                         |
| ----------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| <a name="output_sa_name"></a> [sa_name](#output_sa_name)                      | The name of the storage account |
| <a name="output_sa_primary_connection_string"></a> [sa_primary_connection_string](#output_sa_primary_connection_string)                                           | The connection string that is used for the data factory link                                           |