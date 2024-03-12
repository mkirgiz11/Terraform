// Virtual Mac

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


resource "aws_instance" "main" {
  count                  = 1
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = aws_key_pair.deployer.id

  provisioner "file" {
    source      = "C:\\Users\\Mithat\\Desktop\\terraform\\terraform\\session8\\index.html" // the place where your file exists. path on your machine
    destination = "/tmp/index.html"                                                        // the place where you want to save your file. path on the remote server

    connection {
      type        = "ssh"
      user        = "ec2-user"            // Amazon Linux 2 = ec2-user, Ubuntu = ubuntu, Debian = admin, Centos = centos
      host        = self.public_ip        // public ip of your webserver
      private_key = file("~/.ssh/id_rsa") // private key of your Terraform Server, Local machine
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"            // Amazon Linux 2 = ec2-user, Ubuntu = ubuntu, Debian = admin, Centos = centos
      host        = self.public_ip        // public ip of your webserver
      private_key = file("~/.ssh/id_rsa") // private key of your Terraform Server, Local machine
    }
  }
}

resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // All ports and protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "myTFKey"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "null_resource" "main" { //null_resource is not tracked in terraform.tfstate file
  provisioner "local-exec" {
    command = "echo 'This is a newfile' >> newfile.txt" # Adjust the wait time according to your needs
  }
}

// Packer by Hashicorp
// Packer creates Golden AMI, packer can run Ansible playbooks on virtula servers using provisioners 