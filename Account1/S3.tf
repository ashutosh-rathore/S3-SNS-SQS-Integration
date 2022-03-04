resource "aws_s3_bucket" "bucket" {
  bucket = "test-source-bucket-287444288085"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.id
  topic {
    topic_arn     = aws_sns_topic.new-sns.arn
    events        = ["s3:ObjectCreated:*"]
  }
  depends_on = [
    aws_sns_topic.new-sns,
    aws_sns_topic_policy.default
  ]
}
