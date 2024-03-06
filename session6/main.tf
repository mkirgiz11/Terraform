module "vpc" {
  ############## Module Arguments ############## 
  source = "github.com/mkirgiz11/terraform//vpc?ref=v0.0.1" //(required argument), where you specify child module 
  #  version = "3.3.0"      //(not required), specify the version of your code.
  ############## Module Input Variables ############## 
  aws_region           = "us-east-1"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}





