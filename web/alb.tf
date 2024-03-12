resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = var.internal_feature
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.main.id]
  subnets            = var.lb_subnets 
  
  enable_deletion_protection = false

  tags = {
    Environment = var.env
  }
}

# ALB listener to forward traffic to the target group
resource "aws_lb_listener" "main" {
  count             = length(var.lb_name)
  load_balancer_arn = aws_lb.main.arn
  port              = var.port_80
  protocol          = "HTTP"
  default_action {
    type             = "redirect"
    redirect {
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
# Add another listener for HTTPS on port 443
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.port_443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = aws_acm_certificate.example.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }

}
