terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "abhishek-yadav-terraform-state-bucket"
    key            = "prod/webserver/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "abhishek-yadav-terraform-lock-table"
  }
}
