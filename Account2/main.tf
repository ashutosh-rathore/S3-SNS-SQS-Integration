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
  profile = "Account2"
  shared_credentials_files = ["/Users/ashutosh/.aws/credentials"]
  region       = "us-east-1"
}
