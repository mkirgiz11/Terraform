resource "aws_lb" "main" {
  name               = var.lb_name
  internal           = var.internal_feature
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.main.id]
  subnets            = aws_subnet.public_subnets[*].id 
  
  enable_deletion_protection = true

  tags = {
    Environment = var.env
  }
}

# Configuration for ALB listener to forward traffic to the target group
resource "aws_lb_listener" "main" {
  count             = length(var.lb_name)
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
