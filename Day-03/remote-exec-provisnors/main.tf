resource "aws_instance" "example" {

  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name

  vpc_security_group_ids = [aws_security_group.day_03_sg.id]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "echo '<h1>Hello from Terraform Remote-Exec</h1>' | sudo tee /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("C:\\aws_with_terraform_july_batch\\Day-03\\custom-priya.pem")
      host        = self.public_ip
      timeout     = "4m"
    }
  }

  tags = {
    Name        = "${var.environment}-web-server"
    Environment = var.environment
  }
}
