variable "stack_name" {
  description = "The Stack Base Image"
  type        = string
  default     = ""
}

variable "stack_version" {
  description = "The Stack Version which will be used as a Base Image for Instances Creation"
  type        = string
  default     = ""
}

variable "environment_name" {
  description = "Environment Name that will be used to generate the Resource Names"
  type        = string
  default     = ""
}

variable "region" {
  description = "Azure Region in which the Resources will live on"
  type        = string
  default     = ""
}

variable "azure_subscription_id" {
  description = "Azure Region in which the Resources will live on"
  type        = string
  default     = ""

  validation {
    condition     = length(var.azure_subscription_id) == 36
    error_message = "The azure_subscription value must be informed."
  }
}

variable "newrelic_account_id" {
  description = "New Relic Account ID"
  type        = string
  default     = ""

  validation {
    condition     = length(var.newrelic_account_id) >= 5
    error_message = "The newrelic_account_id value must be informed."
  }
}
