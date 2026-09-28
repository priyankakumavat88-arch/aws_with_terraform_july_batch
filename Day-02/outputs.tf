output "public_ip" {
    description = "The public IP address of the EC2 instance"
   value = aws_instance.example.public_ip
 }

 output "private_ip" {
    description = "The private IP address of the EC2 instance"
   value = aws_instance.example.private_ip
 }

 output "public_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.example.public_dns
}

output "private_dns" {
  description = "The private DNS of the EC2 instance"
  value       = aws_instance.example.private_dns
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}