data "aws_ami" "amazon_linux_2" {
#  executable_users = ["self"]  # not needed for 1 user accounts
  most_recent      = true
#  name_regex       = "^myami-\\d{3}"
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "userdata" {
  template = file("userdata.sh")
  vars = {
    env = var.env
    # variable that will be used in userdata.sh = terraform variable
  }
}


#Retrive the data from existing resource
#Compute a new value

# al2023-ami-2023.3.20240219.0-kernel-6.1-x86_64


# amzn2-ami-kernel-5.10-hvm-2.0.20240223.0-x86_64-gp2
