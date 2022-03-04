resource "aws_sqs_queue" "new-sqs" {
  provider = aws.sqs
  name                      = "Account2queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Name = "Account2queue"
  }
}

resource "aws_sqs_queue_policy" "sqspolicy" {
  provider = aws.sqs
  queue_url = aws_sqs_queue.new-sqs.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.new-sqs.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "arn:aws:sns:us-east-1:287444288085:Account1sns"
        }
      }
    }
  ]
}
POLICY
}