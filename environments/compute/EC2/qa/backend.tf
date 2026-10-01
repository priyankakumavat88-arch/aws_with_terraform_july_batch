terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-priya"
    key    = "compute/priya/qa/ec2/terraform.tfstate"
    region = "ap-south-1"
  }
}
