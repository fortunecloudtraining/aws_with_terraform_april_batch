resource "aws_security_group" "allow_tls" {
  name        = "allow_tls${var.tags}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0749377b786dca09b"

  tags = {
    Name = var.sg_tag
  }
}


resource "aws_vpc_security_group_egress_rule" "outbound_traffic" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "http_rule" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


resource "aws_vpc_security_group_ingress_rule" "https_rule" {
  description = "this for the aws sg https rule"
  security_group_id = aws_security_group.allow_tls.id
  
  ip_protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_ipv4 = "0.0.0.0/0"

}

resource "aws_vpc_security_group_ingress_rule" "ssh_rule" {
    security_group_id = aws_security_group.allow_tls.id

    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
  
}


resource "aws_vpc_security_group_ingress_rule" "icmp_rule" {

    security_group_id = aws_security_group.allow_tls.id

    ip_protocol = "icmp"
    cidr_ipv4   = "0.0.0.0/0"
    from_port = -1
    to_port = -1
}