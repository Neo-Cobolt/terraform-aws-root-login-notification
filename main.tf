
resource "aws_cloudwatch_event_rule" "console" {
  name        = "capture-iam-root-aws-sign-in"
  description = "Capture each AWS Console Sign In"

  event_pattern = <<EOF
{
  "detail-type": ["AWS Console Sign In via CloudTrail"],
  "detail": {
    "userIdentity": {
      "type": ["Root"]
    }
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.aws_logins.arn
}

resource "aws_sns_topic" "aws_logins" {
  name              = "capture-iam-root-aws-login"
  display_name      = var.email_display_name
  kms_master_key_id = aws_kms_key.sns.key_id
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.aws_logins.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

resource "aws_sns_topic_subscription" "topic_email_subscription" {
  for_each = toset(var.email_address_list)

  topic_arn = aws_sns_topic.aws_logins.arn
  protocol  = var.notification_type
  endpoint  = each.key
}

# KMS

resource "aws_kms_key" "sns" {
  description             = var.kms_key_description
  deletion_window_in_days = 30
  policy                  = data.aws_iam_policy_document.event_bridge_sns_kms.json
}

resource "aws_kms_alias" "sns" {
  name          = "alias/root-sns"
  target_key_id = aws_kms_key.sns.key_id
}
