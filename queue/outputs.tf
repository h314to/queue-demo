output "sns_events_topic_arn" {
  value = aws_sns_topic.pulse_events.arn
}

output "sqs_events_queue" {
  value = aws_sqs_queue.pulse_events_queue.arn
}