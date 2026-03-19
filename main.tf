resource "azurerm_log_analytics_workspace" "this" {
  name                         = var.workspace_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  local_authentication_enabled = !var.local_authentication_disabled
  sku                          = "PerGB2018"

  daily_quota_gb    = var.daily_quota_gb
  retention_in_days = var.retention_in_days

  tags = var.tags

  lifecycle {
    # Prevent accidental destroy of Log Analytics workspace.
    prevent_destroy = true
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "audit-logs"
  target_resource_id         = azurerm_log_analytics_workspace.this.id
  log_analytics_workspace_id = coalesce(var.log_analytics_workspace_id, azurerm_log_analytics_workspace.this.id)

  # Ref: https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/monitor_diagnostic_setting#log_analytics_destination_type
  log_analytics_destination_type = null

  dynamic "enabled_log" {
    for_each = toset(var.diagnostic_setting_enabled_log_categories)

    content {
      category = enabled_log.value
    }
  }

  dynamic "enabled_metric" {
    for_each = toset(var.diagnostic_setting_enabled_metric_categories)

    content {
      category = enabled_metric.value
    }
  }
}

# Ref: https://learn.microsoft.com/en-us/azure/azure-monitor/logs/daily-cap#alert-when-daily-cap-is-reached
resource "azurerm_monitor_scheduled_query_rules_alert_v2" "daily_quota_reached" {
  name                = "Daily Data Ingestion Cap Reached - ${azurerm_log_analytics_workspace.this.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  scopes              = [azurerm_log_analytics_workspace.this.id]

  criteria {
    query = <<-QUERY
      _LogOperation | where Category =~ "Ingestion" | where Detail contains "OverQuota"
    QUERY

    time_aggregation_method = "Count"
    resource_id_column      = "_ResourceId"
    operator                = "GreaterThan"
    threshold               = 0
  }

  window_duration      = "PT5M" # Evaluate logs from the last 5 minutes.
  evaluation_frequency = "PT5M" # Evaluate logs every 5 minutes.

  severity = 2 # Warning

  # Query validation fails during creation if no logs exist yet.
  skip_query_validation = true

  action {
    action_groups = var.action_group_ids
  }

  tags = var.tags
}
