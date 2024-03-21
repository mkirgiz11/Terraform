// DEV
variable "env" {
  type        = string
  description = "this variable is for the environment"
  default     = "dev"
}
// T2.MEDIUM for Jenkins
variable "instance_type" {
  type        = string
  description = "instance type for ec2 instance"
  default     = "t2.medium"
}
// UBUNTU 
variable "main_ami" {
  type        = string
  description = "ami id for ec2 instance"
  default     = "ami-080e1f13689e07408"
}
// Key name
variable "key_name" {
  type        = string
  description = "key name for ec2 instance"
  default     = "Mithat@Desktop"
}

variable "default_feature" {
  type    = bool
  default = true
}

variable "sg_description" {
  type        = string
  description = "description for security group"
  default     = "Allow ports and protocols for jenkins instance"
}
// PORTS NEEDED TO BE OPEN
variable "ports" {
  type        = list(number)
  description = "these are port numbers for the instance"
  default     = [22, 8080]
}

variable "cidr_blocks" {
  type        = list(string)
  description = "these are cidr blocks for corresponding ports"
  default     = []
}

variable "ingress_ip_protocol" {
  type        = string
  description = "protocol for the ingress ports"
  default     = "tcp"
}

variable "cidr_ipv4" {
  type        = string
  description = "these are cidr blocks for corresponding ports"
  default     = "0.0.0.0/0"
}

variable "egress_ip_protocol" {
  type        = string
  description = "protocol for the egress ports"
  default     = "-1"
}

variable "subnet_filter_name" {
  description = "Name of the filter"
  default     = "default-for-az"
}

variable "subnet_filter_values" {
  description = "Values for the filter"
  default     = ["true"]
}

variable "az_filter_name" {
  description = "Availability zone filter name"
  default     = "availability-zone"
}

variable "availability_zone" {
  description = "Availability zone"
  default     = "us-east-1a"
}