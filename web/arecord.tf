resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.${var.acm_domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}

# resource "aws_route53_record" "example_root" {
#   zone_id = data.aws_route53_zone.main.zone_id  
#   name    = var.acm_domain_name
#   type    = "A"

#   alias {
#     name                   = aws_lb.main.dns_name  
#     zone_id                = aws_lb.main.zone_id  
#     evaluate_target_health = true
#   }
# }

resource "aws_acm_certificate" "example" {
  domain_name              = var.acm_domain_name
  subject_alternative_names = ["*.mytricloud.com"]
  validation_method        = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "acm_validation" {
  for_each = tomap({
    for option in aws_acm_certificate.example.domain_validation_options : option.domain_name => {
      name    = option.resource_record_name
      type    = option.resource_record_type
      value   = option.resource_record_value
    }
  })

  zone_id = data.aws_route53_zone.main.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.value]
}




# naming & tagging