//Resource group creation
resource "azurerm_resource_group" "rg" {

  name     = var.resource_group_name
  location = var.location

  tags = {
  }
}

//Databricks Workscpase creation
resource "azurerm_databricks_workspace" "example" {
  depends_on = [azurerm_resource_group.rg]

  name                = var.azure_databricks_variables["name"]
  resource_group_name = var.azure_databricks_variables["resource_group_name"]
  location            = var.azure_databricks_variables["location"]
  sku                 = var.azure_databricks_variables["sku_piercing_tier"]
}



//Databricks job creation
resource "databricks_job" "this" {
  depends_on = [azurerm_resource_group.rg]
  name       = "TerraformDemo (${data.databricks_current_user.me.alphanumeric})"


  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest.id
    node_type_id  = data.databricks_node_type.smallest.id
  }

 //Create the notebook pah
  notebook_task {
    notebook_path = databricks_notebook.this.path
  }

  //Send notifications to the email adress on the variables
  email_notifications {
    on_success = var.email_notifier
    on_failure = var.email_notifier
  }
}

//Create notebook resource with Python code
resource "databricks_notebook" "this" {
  depends_on = [azurerm_resource_group.rg]
  path       = "${data.databricks_current_user.me.home}/Terraform"

  language = "PYTHON"

  content_base64 = base64encode(<<-EOT

    # created from ${abspath(path.module)}

    display(spark.range(10))

    display("Hola mundo")

    EOT

  )
}

//Cluster creation
resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "Cluster test"
  spark_version           = data.databricks_spark_version.latest.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 50
  }
}
resource "databricks_group" "de" {
  display_name               = "Data Engineer"
  allow_cluster_create       = true
  allow_instance_pool_create = false
}



resource "databricks_group" "ds" {
  display_name               = "Data Scientist"
  allow_cluster_create       = false
  allow_instance_pool_create = false
}



data "databricks_current_user" "me" {
  depends_on = [azurerm_databricks_workspace.example]
}

data "databricks_spark_version" "latest" {
  depends_on = [azurerm_databricks_workspace.example]
}
data "databricks_node_type" "smallest" {

  depends_on = [azurerm_databricks_workspace.example]

  local_disk = true

}

