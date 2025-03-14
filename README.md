# Terraform module for Azure Monitor Log Analytics

[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-log-analytics)](https://github.com/equinor/terraform-azurerm-log-analytics/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-log-analytics)](https://github.com/equinor/terraform-azurerm-log-analytics/releases/latest)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![SCM Compliance](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-log-analytics/badge)](https://developer.equinor.com/governance/scm-policy/)

Terraform module which creates Azure Monitor Log Analytics resources.

## Features

- Microsoft Entra authentication enforced by default.
- Data retention set to 90 days by default.
- Audit logs sent to created Log Analytics workspace by default.

## Development

1. Read [this document](https://code.visualstudio.com/docs/devcontainers/containers).

1. Clone this repository.

1. Configure Terraform variables in a file `.devcontainer/devcontainer.env`:

    ```env
    TF_VAR_resource_group_name=
    TF_VAR_location=
    ```

1. Open repository in dev container.

## Testing

1. Change to the test directory:

    ```console
    cd test
    ```

1. Login to Azure:

    ```console
    az login
    ```

1. Set active subscription:

    ```console
    az account set -s <SUBSCRIPTION_NAME_OR_ID>
    ```

1. Run tests:

    ```console
    go test -timeout 60m
    ```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
