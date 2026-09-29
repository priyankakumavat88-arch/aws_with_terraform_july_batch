
resource "aws_key_pair" "custom-key" {
  key_name   = "custom-key"
  public_key = file("C:\\aws_with_terraform_july_batch\\Day-03\\custom-priya.pub")
}