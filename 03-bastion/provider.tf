terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
  backend "s3" {
    bucket = "sun26s"
    key    = "expense-infra-bastion"
    region = "us-east-1"
    encrypt = true
    use_lockfile   = true   
  }
}

provider "aws" {
  region = "us-east-1"
}