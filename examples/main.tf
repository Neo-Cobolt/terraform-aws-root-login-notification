#
terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.73"
    }
  }
}


module "root_login_notification" {
  source = "../."

  email_address_list = ["email@example.com"]

  email_display_name = "Root Account Test Login"

  notification_type = "email-json"
}
