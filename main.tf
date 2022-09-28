data "azurerm_subscription" "current" {}

resource "azurerm_log_analytics_workspace" "this" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "audit-logs"
  target_resource_id         = azurerm_log_analytics_workspace.this.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  log {
    category = "Audit"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
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

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_monitor_diagnostic_setting" "subscription" {
  name                       = "audit-logs-${random_id.this.hex}"
  target_resource_id         = data.azurerm_subscription.current.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  log {
    category = "Administrative"
    enabled  = true
  }

  log {
    category = "ServiceHealth"
    enabled  = false
  }

  log {
    category = "ResourceHealth"
    enabled  = false
  }

  log {
    category = "Alert"
    enabled  = false
  }

  log {
    category = "Autoscale"
    enabled  = true
  }

  log {
    category = "Recommendation"
    enabled  = false
  }

  log {
    category = "Security"
    enabled  = true
  }

  log {
    category = "Policy"
    enabled  = true
  }
}
