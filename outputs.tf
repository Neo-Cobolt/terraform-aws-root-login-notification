#
output "sns_arn" {
  value = aws_sns_topic.aws_logins.arn
  description = "value"
}

output "sns_display_name" {
  value = aws_sns_topic.aws_logins.display_name
  description = "Display name for SNS topic"
}

output "event_bridge_rule_arn" {
  value = aws_cloudwatch_event_rule.console.arn
  description = "Event bridge rule arn."
}

output "event_bridge_rule_description" {
  value = aws_cloudwatch_event_rule.console.description
  description = "Event bridge rule description."
}

output "event_bridge_rule_event_bus_name" {
  value = aws_cloudwatch_event_rule.console.event_bus_name
  description = "Event bridge bus name."
}

output "sns_topic_subscriptions_arn" {
  value = aws_sns_topic_subscription.topic_email_subscription.*
  description = "All SNS topic subscriptions arns"
}
