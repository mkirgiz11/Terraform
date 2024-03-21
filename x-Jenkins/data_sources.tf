#AWS Default VPC
data "aws_vpc" "default" {
  default = var.default_feature
}
#AWS Default Subnet
data "aws_subnet" "default" {
  filter {
    name   = var.subnet_filter_name
    values = var.subnet_filter_values
  }

  filter {
    name   = var.az_filter_name
    values = [var.availability_zone]
  }
}