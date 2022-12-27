data "aws_caller_identity" "this" {}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.aws_logins.arn]
  }
}


data "aws_iam_policy_document" "event_bridge_sns_kms" {
  statement {
    sid       = "Allow CWE to use the key"
    effect    = "Allow"
    resources = [
      #var.kms_master_key_id
      "*"
    ]

    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey",
    ]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }

  statement {
    sid       = "Enable IAM policies"
    effect    = "Allow"
    resources = [
      #var.kms_master_key_id
      "*"
    ]
    actions   = ["kms:*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.this.account_id}:root"]
    }
  }
}
