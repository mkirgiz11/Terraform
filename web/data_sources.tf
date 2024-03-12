data "aws_vpc" "default" {
  default = true
}


data "aws_route53_zone" "main" {
  name = var.acm_domain_name
}



