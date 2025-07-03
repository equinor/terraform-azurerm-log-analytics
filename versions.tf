terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Version 4.35.0 is required to use the "local_authentication_enabled" argument for the "azurerm_log_analytics_workspace" resource.
      version = ">= 4.35.0"
    }
  }
}
