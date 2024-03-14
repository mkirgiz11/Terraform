terraform {
  backend "s3" {
    bucket = "terraform-september-2023-backend-bucket" # Created Bucket name
    key    = "session9/terraform.tfstate"              # path where you would like to create your terraform.tfstate file
    region = "us-east-1"                               #N.Virginia
    dynamodb_table = "terraform-backend-state-locking"
  }
}
