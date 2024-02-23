resource "aws_instance" "web" {
  ami           = "ami-0440d3b780d96b29d" #value after argument(ami)
  instance_type = "t2.micro" #value after argument(instance_type)
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