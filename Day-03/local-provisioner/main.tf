resource "aws_instance" "example" {

  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name

  vpc_security_group_ids = [aws_security_group.day_03_sg.id]

  provisioner "local-exec" {
    command = "echo The instance ${self.public_ip} is now running >> instance_info.txt"
  }

  tags = {
    Name        = "${var.environment}-web-server"
    Environment = var.environment
  }

}
