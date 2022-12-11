variable "email_display_name" {
    default = ""
    type = string
}

variable "email_address_list" {
  type = list
  
}

variable "kms_key_description" {
  type = string
  default = "KMS Root SNS login Notification"
}