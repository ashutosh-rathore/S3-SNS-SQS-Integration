terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "Account1"
  shared_credentials_files = ["/Users/ashutosh/.aws/credentials"]
  region       = "us-east-1"
}

provider "aws" {
  alias  = "sqs"
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::785298011536:role/foraccount1sns"
  }
}

resource "aws_sns_topic_subscription" "sns-topic" {
  provider = aws.sqs
  topic_arn = aws_sns_topic.new-sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.new-sqs.arn
}
