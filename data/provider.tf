provider "aws" {
  access_key = "${var.aws_access_key}" 
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
  profile = "csw-profile"

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
