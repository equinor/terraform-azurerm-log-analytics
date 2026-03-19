# Terraform module for Azure Log Analytics

Terraform module which creates Azure Log Analytics resources.

## Features

- Log Analytics workspace created in specified resource group.
- Microsoft Entra authentication enforced by default.
- Daily data ingestion cap set to 5 GB by default to protect against unexpected spikes in data volume.
- Data retention set to 90 days by default.
- Audit logs sent to created Azure Log Analytics workspace by default.
- (Optional) Alert notifications sent to given Azure Monitor action groups:
  - Daily data ingestion cap reached

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Monitoring Contributor` at the Azure Monitor action group scopes.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "log_analytics" {
  source  = "equinor/log-analytics/azurerm"
  version = "~> 2.4"

  workspace_name      = "example-workspace"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  action_group_ids    = [azurerm_monitor_action_group.example.id]
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

resource "azurerm_monitor_action_group" "example" {
  name                = "CriticalAlertsAction"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "p0action"

  arm_role_receiver {
    name                    = "Notify Monitoring Readers"
    role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
    use_common_alert_schema = true
  }
}
```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
