# module outputs

output "databricks_host" {
  value = "https://${azurerm_databricks_workspace.example.workspace_url}/"
}

output "notebook_url" {
  value = databricks_notebook.this.url
}

output "job_url" {
  value = databricks_job.this.url
}