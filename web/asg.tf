resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1

  target_group_arns = ["${aws_lb_target_group.main.arn}"] 

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
}