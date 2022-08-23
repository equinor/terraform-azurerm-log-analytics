data "azurerm_subscription" "current" {}

resource "azurerm_log_analytics_workspace" "this" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "activity-logs"
  target_resource_id         = data.azurerm_subscription.current.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  log {
    category = "Administrative"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "ServiceHealth"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "ResourceHealth"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Alert"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Autoscale"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Recommendation"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Security"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Policy"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
