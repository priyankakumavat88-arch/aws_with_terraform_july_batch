resource "aws_vpc_security_group_ingress_rule" "allow_smtp_ipv4" {
  security_group_id = aws_security_group.priya_tf_sg.id
  from_port         = 25
  to_port           = 25
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}
