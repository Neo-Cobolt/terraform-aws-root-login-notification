variable "email_display_name" {
  default     = ""
  type        = string
  description = "value"
}

variable "email_address_list" {
  type        = list(any)
  description = "value"
}

variable "notification_type" {
  type        = string
  default     = "email-json"
  description = "value"
}
