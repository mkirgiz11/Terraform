resource "aws_instance" "jenkins-ec2" {
  ami                         = var.main_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = data.aws_subnet.default.id
  associate_public_ip_address = true
  user_data                   = file("userdata.sh")
  tags = {
    Name        = "${var.env}-instance"
    Environment = var.env
  }
}

