# ===== Application Load Balancer Variables =====

variable "lb_name" {
    type = string
    description = "load balancer name for web app"
    default = "web-app-alb"
}

variable "internal_feature" {
  type    = bool
  default = false
}

variable "lb_type" {
    type = string
    description = "load balancer type for web app"
    default = "application"
}

variable "default_feature" {
  type    = bool
  default = true
}

variable "env" {
    type = string
    description = "this variable is for the environment"
    default = "dev"
}

# ===== Security Group Variables =====

variable "lb_sg_name" {
    type = string
    description = "security group name for web app"
    default = "web-app-sg"
}

variable "lb_sg_description" {
    type = string
    description = "description for sg"
    default = "Allow ports and protocols for web instance"
}

variable "ports" {
    type = list(number)
    description = "these are port numbers for the instance"
    default = [ 443, 80 ]
}

variable "cidr_blocks" {
    type = list(string)
    description = "these are cidr blocks for corresponding ports"
    default = [ "0.0.0.0/0", "0.0.0.0/0" ]
}

variable "cidr_ipv4" {
    type = string
    description = "these are cidr blocks for corresponding ports"
    default = "0.0.0.0/0" 
}

variable "egress_ip_protocol" {
    type = string
    description = "protocol for the egress ports"
    default = "-1"
}

# ===== Target Group Variables =====
variable "lb_tg_name" {
    type = string
    description = "target group name for web app"
    default = "web-app-tg"
}

variable "lb_tg_type" {
    type = string
    description = "target group type for web app"
    default = "alb"
}

variable "lb_tg_port" {
    type = number
    description = "this is port number for target group"
    default = 80
}

variable "lb_tg_protocol" {
    type = string
    description = "target group protocol web app"
    default = "HTTP"
}

variable "public_subnet_cidrs" {
  default = ["172.31.128.0/24", "172.31.144.0/24"]
}

# ===== SSL certificate ARN for HTTPS =====
variable "ssl_certificate_arn" {
  type        = string
  description = "The ARN of the SSL certificate for HTTPS"
  default     = "arn:aws:acm:us-east-1:712331462175:certificate/a8625959-1e6d-4fd6-88e2-a76d987f4fa9"  # Replace with your actual ARN
}

variable "asg_tags" {
  default = [
    {
      key                 = "env"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "team"
      value               = "devops"
      propagate_at_launch = true
    },
    {
      key                 = "app"
      value               = "backend"
      propagate_at_launch = true
    },
    {
      key                 = "project"
      value               = "web"
      propagate_at_launch = true
    },
    {
      key                 = "managed_by"
      value               = "terraform"
      propagate_at_launch = true
    },
    {
      key                 = "owner"
      value               = "Mithat"
      propagate_at_launch = true
    },
  ]
}
# ===== SUBNETS FOR LOAD BALANCER =====
variable "lb_subnets" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
  default     = ["subnet-0f95e2d910c33c7d6", "subnet-0221784881a6e82a9"]
}

# ===== DOMAIN NAME FOR ACM =====
variable "acm_domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
  default     = "mytricloud.com"
}

# ===== Launch Template Instance  =====
## Ami ID ##
variable "ami_id" {
  description = "ID of the Amazon Machine Image (AMI)"
  type        = string
  default     = "ami-0440d3b780d96b29d"
}
## Instance Type ##
variable "instance_type" {
  description = "Instance type for the autoscaling group"
  type        = string
  default     = "t2.micro"
}
variable "asg_ltname" {
  description = "Name for the autoscaling group"
  type        = string
  default     = "web-app-lt"
}

# ===== Variables for the ASG =====

## Availability Zone ##
variable "availability_zones" {
  description = "List of availability zones for the autoscaling group"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

## Desired Capacity ##
variable "desired_capacity" {
  description = "Desired capacity for the autoscaling group"
  type        = number
  default     = 1
}

## Max Size ##
variable "max_size" {
  description = "Maximum size for the autoscaling group"
  type        = number
  default     = 3
}

## Min Size ##
variable "min_size" {
  description = "Minimum size for the autoscaling group"
  type        = number
  default     = 1
}

# ===== Variables for the Load Balancer Security Group =====

variable "alb_sg_protocol" {
  description = "Protocol for the load balancer"
  type        = string
  default     = "tcp"
}

## Port 443 ##
variable "port_443" {
  description = "Port for HTTPS traffic (443,80,..)"
  type        = number
  default     = 443
}

## Port 80 ##
variable "port_80" {
  description = "Port for HTTPS traffic (443,80,..)"
  type        = number
  default     = 80
}