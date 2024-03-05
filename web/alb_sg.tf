resource "aws_security_group" "main" {
  vpc_id      = data.aws_vpc.default.id  # Using the first default VPC
  name        = format("%s-security-group", var.env)
  description = var.lb_sg_description

  tags = {
    Name = var.lb_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  count = length(var.ports)  # ----->>> length of given list, map or string
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = element( var.cidr_blocks, count.index )
  from_port         = element( var.ports, count.index )
  ip_protocol       = "tcp"
  to_port           = element( var.ports, count.index )
}

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.egress_ip_protocol 
}