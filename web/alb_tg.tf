resource "aws_lb_target_group" "main" {
  name        = var.lb_tg_name
  port        = var.lb_tg_port
  protocol    = var.lb_tg_protocol
  vpc_id      = data.aws_vpc.default.id # Using the first default VPC

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
