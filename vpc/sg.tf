resource "aws_security_group" "websg" {
  name        = "websg"
  description = "Allow ports and protocols for web instance"

  tags = {
    Name = "web_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  security_group_id = aws_security_group.websg.id #first_label.second_label.attribute
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.websg.id #first_label.second_label.attribute
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports. Protocol : http, https, tcp, udp,icmp
                           # -1 means all protocols 
}

# Security Group: Is it stateful or stateless?
# Security Group: Always allow the rules, there is no deny. You only manage inbound rules
#                 not outbound. whatever you add in inbound
#NACL: Allow or deny, Priority stating from 100, you manage both inbound and outbound rules, tied to subnets.