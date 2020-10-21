resource "aws_sns_topic" "pulse_events" {
  name = "pulse-events-topic"
  tags = var.tags
}

resource "aws_sqs_queue" "pulse_events_queue" {
  name                      = "pulse-events-queue"
  max_message_size          = 2048
  message_retention_seconds = 86400
  tags                      = var.tags
}

resource "aws_sns_topic_subscription" "pulse_events_sqs_target" {
  topic_arn            = aws_sns_topic.pulse_events.arn
  protocol             = "sqs"
  raw_message_delivery = var.allow_raw_messages
  endpoint             = aws_sqs_queue.pulse_events_queue.arn
}

resource "aws_sqs_queue_policy" "pulse_events_queue" {
  queue_url = aws_sqs_queue.pulse_events_queue.id
  policy    = data.aws_iam_policy_document.sqs_policy.json
}

data "aws_iam_policy_document" "sqs_policy" {
  statement {
    actions = ["SQS:*"]
    effect  = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = [aws_sqs_queue.pulse_events_queue.arn]
  }
}