resource "aws_autoscaling_group" "bar" {
  availability_zones = var.availability_zones
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  target_group_arns = ["${aws_lb_target_group.main.arn}"]

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Default"
  }

  dynamic "tag" {
    for_each = var.asg_tags
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.value
    } 
  }
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}
