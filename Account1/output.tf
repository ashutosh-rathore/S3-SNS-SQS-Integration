output "sqs_arn" {
    value = aws_sqs_queue.new-sqs.arn
}

output "bucket_arn" {
    value = aws_s3_bucket.bucket.arn
}

output "sns_arn" {
    value = aws_sns_topic.new-sns.arn
}

output "queue-url" {
    value = aws_sqs_queue_policy.sqspolicy.queue_url
}