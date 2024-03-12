resource "aws_launch_template" "main" {
  name = var.asg_ltname
  image_id = var.ami_id
  instance_type = var.instance_type
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.main.id]
  }
#  default_version = "1"
  update_default_version = true
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

  user_data = filebase64("apache.sh")
}