resource "aws_key_pair" "priya_self_managed_key" {
  key_name   = var.key_name
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIED6VgO+PfBC4Iio6DCh0lYCxTWDjBrcMZm4uXZL9Nx2 priyankakumavat88@gmail.com"
}