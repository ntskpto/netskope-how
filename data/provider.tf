provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket         = "netskope-csw-terraform-backend"
    key            = "s3/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    profile        = "csw-profile"
  }
}
