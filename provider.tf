provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}" 
  secret_key = "${var.AWS_SECRET_KEY}"
  region = "${var.AWS_REGION}"
  profile = "${var.AWS_PROFILE}"
  
  # assume_role = {
  #   role_arn = "${var.workspace_iam_roles[terraform.workspace]}"
  # }
}


terraform {
  backend "s3" {
    bucket         = "netskope-csw-terraform-backend"
    key            = "s3/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    profile        = "csw-profile"
    # role_arn       = "arn:aws:iam::836848372824:role/terraform-backend"
  }
}

# variable "workspace_iam_roles" {
#   default = {
#     marcus      = "arn:aws:iam::836848372824:role/terraform-backend-marcus",
#     phil        = "arn:aws:iam::836848372824:role/terraform-backend-phil",
#     eugen       = "arn:aws:iam::836848372824:role/terraform-backend-eugen",
#     georg       = "arn:aws:iam::836848372824:role/terraform-backend-georg",
#     rainer      = "arn:aws:iam::836848372824:role/terraform-backend-rainer",
#   }
# }
