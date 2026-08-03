# Basic example

Terraform configuration which creates an Azure Log Analytics workspace.

Use Terraform `>= 1.1.0, < 2.0.0`. With AzureRM v5, registration of `Microsoft.OperationalInsights` and `Microsoft.Insights` is a separate subscription-scope bootstrap step and should ideally be performed by a platform or subscription admin identity before applying the example. After that, the example apply only needs the documented resource-group and action-group roles.
