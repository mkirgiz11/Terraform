variable "env" {
    type = string
    description = " This variable is for the environment "
    default = "dev"
}

variable "ports" {
    type = list(number)
    description = " These are port numbers for the instance"
    default = [ 443, 80, 22, 3306, 53, 21, 23 ]
}

variable "cidr_blocks" {
    type = list(string)
    description = "These are cidr blocks for corresponding ports"
    default = ["0.0.0.0/0","0.0.0.0/0", "10.0.0.0/16", "10.0.0.250/32","0.0.0.0/0","0.0.0.0/0","0.0.0.0/0" ]
}