resource "aws_launch_template" "main" {
  name = "web-app-lt"
  image_id = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.main.id]
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

  user_data = base64encode("apache.sh")
}