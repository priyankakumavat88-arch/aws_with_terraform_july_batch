aws_region     = "ap-south-1"
aws_vpc_cidr   = "192.168.0.0/16"
environment    = "qa"

enable_dns_support   = true
enable_dns_hostnames = true

public_subnet_01_cidr = "192.168.1.0/24"
public_subnet_01_availability_zone = "ap-south-1a"

private_subnet_01_cidr = "192.168.11.0/24"
private_subnet_01_availability_zone = "ap-south-1a"

eip_name = "qa-nat-eip"

public_subnet_02_cidr = "192.168.2.0/24"
public_subnet_02_availability_zone = "ap-south-1b"

public_subnet_03_cidr = "192.168.3.0/24"
public_subnet_03_availability_zone = "ap-south-1c"

private_subnet_02_cidr = "192.168.12.0/24"
private_subnet_02_availability_zone = "ap-south-1b"

private_subnet_03_cidr = "192.168.13.0/24"
private_subnet_03_availability_zone = "ap-south-1c"
