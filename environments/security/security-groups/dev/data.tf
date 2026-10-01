data "terraform_remote_state" "vpc_backend" {
  backend = "s3"

  config = {
    bucket = "terraform-remote-backend-priya"
    key    = "Networking/priya/qa/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}