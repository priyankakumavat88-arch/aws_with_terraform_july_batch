module "vpc_module" {
  source = "../../../../modules/networking/VPC"

  aws_region           = var.aws_region
  aws_vpc_cidr         = var.aws_vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  environment          = "dev"

  public_subnet_01_cidr              = var.public_subnet_01_cidr
  public_subnet_01_availability_zone = var.public_subnet_01_availability_zone
  private_subnet_01_cidr              = var.private_subnet_01_cidr
  private_subnet_01_availability_zone = var.private_subnet_01_availability_zone
}

