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

variable "retention_in_days" {
  description = "The number of days that logs should be retained."
  type        = number
  default     = 90
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
