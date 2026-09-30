terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-priya"             # add bucket name here which you created in AWS S3
    key    = "compute/priya/qa/ec2/terraform.tfstate" # add path where you want to store the state file in S3 bucket
    region = "ap-south-1"                                 # add region where you created the S3 bucket
  }
}
