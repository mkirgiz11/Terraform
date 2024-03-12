resource "aws_instance" "web" {
  count = 1                                     # Creates same resource for multiple times  
  ami           = data.aws_ami.amazon_linux_2.image_id      #value after argument(ami)
  instance_type = "t2.micro"                    #value after argument(instance_type)
  vpc_security_group_ids = [ aws_security_group.main.id ]  #attribute ID for security group
  user_data = data.template_file.userdata.rendered         # Similar to cat command in linux --->output
  tags = {
    Name        = "${var.env}-instance"         #dev-instance, qa-instance, stage-instance, prod-instance
    # Name2       = format("%s-instance, var.env")   // dev-instance
    # Name3       = format("%d instance, 1")        // 1 instance
    Environment = var.env                       #Reference to input variable var.variable_name
    # Add more tags as needed
    }
    lifecycle {                                 # Meta-argument to create the new resource before destroying old. to prevent downtime
      create_before_destroy = true
    }
}


### HashiCorp Language
##Terraform##
##2 Main Blocks
    # 1.Resource = Block
    # 2.Data_source = Block

#resource = block
    # Resource block is to designed to create and manage resources.

# aws_instance= first label - indicates what resource needs to be created
    # (defined by terraform )

# web = second_label - logical name or logical id for the resource. 
    # Keep in mind it is a resource name. (defined by author)
    # Logical name must be unique

# ami, instance_type = arguments (configurations)
    # (defined by Terraform)

# Argument values are known BEFORE you create the resource(AMI ID etc..)
# Attribute values are known AFTER you create the resource(Resource ID, ARN etc..)

## Working Directory ##
# This directory is a place where you declare all the .tf files 
# and execute your TF commands

#Terraform init
# Initializes the working directory
# Terraform Folder is the working directory
# will read every .tf file in this directory

#Terrafom Reference to Resource
# firstlabel_secondlabel.attribute
# References do not need "". Reference to Resource and and Reference to named values never use ""


## Reference to data source
# data "aws ami" "amazonlinux_2" = retrieve the data from ami
# reference: data.first_label.second_label.attribute

## FORMAT#
# format("Hello, %s!", "Ander")
# Hello, Ander!

# %s = string
# %d = number, integer
