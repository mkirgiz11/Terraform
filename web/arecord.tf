resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.main.zone_id  
  name    = "www.${var.lb_name}.mytricloud.com"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name  
    zone_id                = aws_lb.main.zone_id   
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "example_root" {
  zone_id = data.aws_route53_zone.main.zone_id  
  name    = "${var.lb_name}.mytricloud.com"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name  
    zone_id                = aws_lb.main.zone_id  
    evaluate_target_health = true
  }
}





