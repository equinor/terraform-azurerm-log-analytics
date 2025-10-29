# Terraform module for Azure Log Analytics

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
