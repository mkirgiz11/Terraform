terraform {
  backend "s3" {
    bucket = "terraform-september-2023-backend-bucket" # Created Bucket name
    key    = "terraform.tfstate"             # path where you would like to create your terraform.tfstate file
    region = "us-east-1"                               #N.Virginia
    workspace_key_prefix = "workspace/project-a"

  }
}

# Default
# Backend file path : workspace/project-a/terraform.tfstate

# New : dev
# Backend file path : workspace/project-a/dev/terraform.tfstate

# New : prod
# Backend file path : workspace/project-a/prod/terraform.tfstate