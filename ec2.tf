resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}

# HashiCorp Language
#Terraform
# 2 Main Blocks
    # 1.Resource = Block
    # 2.Data_source

#resource = block
    # Resource block is to designed to create and manage resources.

# aws_instance= first label - indicates what resource needs to be created
    # (defined by terraform )

# web = second_label - logical name or logical id for the resource. 
    # Keep in mind it is a resource name. (defined by author)
    # Logical name must be unique

# ami, instance_type = arguments 
    # (defined by Terraform)

