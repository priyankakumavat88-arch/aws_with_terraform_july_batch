resource "aws_security_group" "priya_tf_sg" {
  name        = var.sg_name
  description = "Allow HTTP, HTTPS traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.environment}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.priya_tf_sg.id
  description       = "Allow HTTPS"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.priya_tf_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_ipv6" {
  security_group_id = aws_security_group.priya_tf_sg.id
  ip_protocol       = "-1"
  cidr_ipv6         = "::/0"
}

