module "vpc_module" {
  source = "../../../../modules/networking/VPC"

  aws_region           = var.aws_region
  aws_vpc_cidr         = var.aws_vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  environment = "qa"  
}
