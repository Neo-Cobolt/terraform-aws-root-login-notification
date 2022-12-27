variable "email_display_name" {
  default     = ""
  type        = string
  description = "Display name of the email sent to users. It is best to name this after the account so you can tell accounts apart easily."
}

variable "email_address_list" {
  type        = list(any)
  description = "List of email addresses to email from sns topic."
}

variable "notification_type" {
  type        = string
  default     = "email-json"
  description = "The type of notification to deliver, currently setup for email and email-json only."
}
