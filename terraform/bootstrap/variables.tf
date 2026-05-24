variable "location" {
  description = "Azure region for the Terraform state backend."
  type        = string
  default     = "uksouth"
}

variable "environment" {
  description = "Environment name for shared bootstrap resources."
  type        = string
  default     = "shared"
}

variable "project_name" {
  description = "Project name used for backend resource naming."
  type        = string
  default     = "secure-platform-lab"
}

variable "storage_account_suffix" {
  description = "Unique suffix for the Terraform state storage account. Use lowercase letters and numbers only."
  type        = string
}