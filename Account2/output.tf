#output "sqs_arn" {
#    value = aws_sqs_queue.new-sqs.arn
#}

output "role_arn" {
    value = aws_iam_role.role.arn
}