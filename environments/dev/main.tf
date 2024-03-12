module "vpc" {
  ############## Module Arguments ############## 
  source = "../../modules/vpc" //(required argument), where you specify child module 
  #  version = "3.3.0"      //(not required), specify the version of your code.
  ############## Module Input Variables ############## 
  aws_region           = "us-east-1"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}

// Child module can be called locally or remotely
// If you are calling your child module locally, you need to specify path to your module

// terraform fmt - formatting
// terraform validate - Validating the Syntax


############### Terraform Registry ############### 
module "web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  ############## Module Input Variables ############## 
  name          = "web"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_0 // module.module_name.output_name

}
