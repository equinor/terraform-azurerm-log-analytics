terraform {
  required_version = ">= 1.1.0, < 2.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Version 4.35.0 is required to use the "local_authentication_enabled" argument.
      version = ">= 4.35.0, < 6.0"
    }
  }
}
