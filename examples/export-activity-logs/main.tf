provider "azurerm" {
  features {}
}

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${random_id.this.hex}"
  location = var.location
}

module "log_analytics" {
  # source = "github.com/equinor/terraform-azurerm-log-analytics"
  source = "../.."

  workspace_name      = "log-${random_id.this.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
}

data "azurerm_subscription" "this" {}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "activity-logs-${random_id.this.hex}"
  target_resource_id         = data.azurerm_subscription.this.id
  log_analytics_workspace_id = module.log_analytics.workspace_id

  log {
    category = "Administrative"
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
    category = "Policy"
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
}
