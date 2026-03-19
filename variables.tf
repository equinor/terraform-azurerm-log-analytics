variable "workspace_name" {
  description = "The name of this Log Analytics workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "local_authentication_disabled" {
  description = "Should local authentication using shared key be disabled for this Log Analytics workspace? If value is true, Microsoft Entra authentication must be used instead."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The ID of a Log Analytics workspace to send diagnostics to. If value is null, diagnostics will be sent to this Log Analytics workspace."
  type        = string
  nullable    = true
  default     = null
}

variable "daily_quota_gb" {
  description = "The daily data ingestion cap in GB for this Log Analytics workspace."
  type        = number
  nullable    = false
  default     = 5
}

variable "retention_in_days" {
  description = "The number of days that logs should be retained. Value must be between 30 and 730."
  type        = number
  nullable    = false
  default     = 90

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "Retention must be between 30 and 730 days."
  }
}

variable "diagnostic_setting_enabled_log_categories" {
  description = "A list of log categories to be enabled for this diagnostic setting."
  type        = list(string)
  default     = ["Audit"]
}

variable "diagnostic_setting_enabled_metric_categories" {
  description = "A list of metric categories to be enabled for this diagnostic setting."
  type        = list(string)
  default     = []
}

variable "action_group_ids" {
  description = "A list of IDs for action groups to send alerts to."
  type        = list(string)
  nullable    = false
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
