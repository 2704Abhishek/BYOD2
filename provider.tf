provider "aws" {
  region = var.region
  # (Optionally) profile = "your-aws-cli-profile"
}

# Use provider version constraint via required_providers block:
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
