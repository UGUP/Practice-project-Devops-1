#Using AWS provider to manage the Infrastructure.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

# Initializing the s3 bucket  for backend state store.
backend "s3" {
    bucket = "as2-project"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

