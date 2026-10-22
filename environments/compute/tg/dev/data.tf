data "terraform_remote_state" "vpc_backend" {
  backend = "s3"

  config = {
   bucket = "terraform-remote-backend-priya"             # add bucket name here which you created in AWS S3
    key    = "network/priya/dev/vpc/terraform.tfstate" # add path where you want to store the state file in S3 bucket
    region = "ap-south-1"
  }
}