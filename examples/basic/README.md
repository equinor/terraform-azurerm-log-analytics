# Basic example

Terraform configuration which creates an Azure Log Analytics workspace.

Use Terraform `>= 1.1.0, < 2.0.0` and AzureRM `>= 4.35.0, < 6.0`. Ensure `Microsoft.OperationalInsights` and `Microsoft.Insights` are registered before applying the example, ideally by a platform or subscription admin identity. That registration step is separate from least-privilege applies for both AzureRM v4 and v5; AzureRM v5 just makes it explicit because it no longer auto-registers providers by default.
