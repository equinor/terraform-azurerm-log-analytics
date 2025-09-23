# Terraform module for Azure Log Analytics

[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-log-analytics)](https://github.com/equinor/terraform-azurerm-log-analytics/releases/latest)
[![Terraform Module Downloads](https://img.shields.io/terraform/module/dt/equinor/log-analytics/azurerm)](https://registry.terraform.io/modules/equinor/log-analytics/azurerm/latest)
[![GitHub contributors](https://img.shields.io/github/contributors/equinor/terraform-azurerm-log-analytics)](https://github.com/equinor/terraform-azurerm-log-analytics/graphs/contributors)
[![GitHub Issues](https://img.shields.io/github/issues/equinor/terraform-azurerm-log-analytics)](https://github.com/equinor/terraform-azurerm-log-analytics/issues)
[![GitHub Pull requests](https://img.shields.io/github/issues-pr/equinor/terraform-azurerm-log-analytics)](https://github.com/equinor/terraform-azurerm-log-analytics/pulls)
[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-log-analytics)](https://github.com/equinor/terraform-azurerm-log-analytics/blob/main/LICENSE)

Terraform module which creates Azure Log Analytics resources.

## Features

- Log Analytics workspace created in specified resource group.
- Microsoft Entra authentication enforced by default.
- Data retention set to 90 days by default.
- Audit logs sent to created Log Analytics workspace by default.

## Prerequisites

- Azure role `Contributor` at the resource group scope.

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
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}
```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
