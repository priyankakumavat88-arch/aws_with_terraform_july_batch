data "terraform_remote_state" "vpc_backend" {
  backend = "s3"

  config = {
    bucket = "terraform-remote-backend-priya"
    key    = "Networking/priya/qa/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}

module "ec2_module" {
  source = "../../../../modules/compute/EC2"

  instance_ami_id = var.instance_ami_id
  instance_type   = var.instance_type

  subnet_id = data.terraform_remote_state.vpc_backend.outputs.public_subnet_01_id

  aws_region                  = var.aws_region
  associate_public_ip_address = var.associate_public_ip_address
  environment                 = var.environment
}
