variable "email_display_name" {
  default     = ""
  type        = string
  description = "value"
}

variable "email_address_list" {
  type        = list(any)
  description = "value"
}

variable "kms_key_description" {
  type        = string
  default     = "KMS Root SNS login Notification"
  description = "value"
}

variable "notification_type" {
  type        = string
  default     = "email-json"
  description = "value"
}
