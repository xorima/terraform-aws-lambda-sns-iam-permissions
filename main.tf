resource "aws_iam_role_policy" "lambda_policy" {
  name   = "Allow-${var.lambda_name}-sns-access"
  role   = var.lambda_role_name
  policy = data.aws_iam_policy_document.lambda_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    actions   = ["sns:CreateTopic", "sns:Publish"]
    effect    = "Allow"
    resources = local.sns_topic_arns_with_name
  }
}
