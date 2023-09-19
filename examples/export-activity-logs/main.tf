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

  enabled_log {
    category = "Administrative"
  }

  enabled_log {
    category = "Alert"
  }

  enabled_log {
    category = "Policy"
  }

  enabled_log {
    category = "Security"
  }
}
