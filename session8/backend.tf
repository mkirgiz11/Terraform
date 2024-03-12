terraform {
  backend "s3" {
    bucket = "terraform-september-2023-backend-bucket" # Created Bucket name
    key    = "session8/terraform.tfstate"              # path where you would like to create your terraform.tfstate file
    region = "us-east-1"                               #N.Virginia
  }
}