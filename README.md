# Terraform module for Azure Log Analytics

Terraform module which creates Azure Log Analytics resources.

## Features

- Log Analytics workspace created in specified resource group.
- Microsoft Entra authentication enforced by default.
- Daily data ingestion cap set to 10 GB by default to protect against unexpected spikes in data volume.
- Data retention set to 90 days by default.
- Audit logs sent to created Azure Log Analytics workspace by default.
- (Optional) Alerts sent to given Azure Monitor action groups:
  - Daily Data Ingestion Cap Reached

## Prerequisites

- Terraform `>= 1.15.0`.
- Azure role `Contributor` at the resource group scope.
- Azure role `Monitoring Contributor` at the Azure Monitor action group scopes.
- With AzureRM v5, Azure resource provider registration is a separate subscription-scope bootstrap step. Ensure required providers such as `Microsoft.OperationalInsights` and `Microsoft.Insights` are registered before `terraform apply`, ideally by a platform or subscription admin identity.
- After that bootstrap step, normal module applies still only require the roles listed above at the resource group and action group scopes.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "log_analytics" {
  source  = "equinor/log-analytics/azurerm"
  version = "~> 2.5"

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
