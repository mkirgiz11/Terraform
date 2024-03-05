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

#SSL certificate ARN for HTTPS
variable "ssl_certificate_arn" {
  type        = string
  description = "The ARN of the SSL certificate for HTTPS"
  default     = "arn:aws:acm:us-east-1:712331462175:certificate/a8625959-1e6d-4fd6-88e2-a76d987f4fa9"  # Replace with your actual ARN
}