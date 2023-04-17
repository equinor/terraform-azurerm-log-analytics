resource "azurerm_log_analytics_workspace" "this" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                           = "audit-logs"
  target_resource_id             = azurerm_log_analytics_workspace.this.id
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.this.id
  log_analytics_destination_type = var.log_analytics_destination_type

  dynamic "enabled_log" {
    for_each = toset(var.diagnostic_setting_enabled_log_categories)

    content {
      category = enabled_log.value
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
