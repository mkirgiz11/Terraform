data "aws_vpc" "default" {
  default = var.default_feature
}

data "aws_subnet_ids" "default_subnets" {
  vpc_id = data.aws_vpc.default.id  # Replace var.vpc_id with the ID of your VPC
  
  filter {
    name   = "default-for-vpc"
    values = ["true"]
  }
  
  filter {
    name   = "availability-zone"
    values = ["us-east-2a", "us-east-2b"]
  }

  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

data "aws_route53_zone" "main" {
  name = "cloudinjen.com"
}