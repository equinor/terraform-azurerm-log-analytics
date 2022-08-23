output "workspace_id" {
  description = "The ID of this Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.this.id
}
