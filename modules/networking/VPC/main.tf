resource "aws_vpc" "main" {
  cidr_block       = var.aws_vpc_cidr
  instance_tenancy = "default"

  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "private_subnet_01" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_01_cidr
  availability_zone       = var.private_subnet_01_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.private_subnet_01_availability_zone}-private-subnet-01"
  }
}

resource "aws_subnet" "private_subnet_02" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_02_cidr
  availability_zone       = var.private_subnet_02_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.private_subnet_02_availability_zone}-private-subnet-02"
  }
}

resource "aws_subnet" "private_subnet_03" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_03_cidr
  availability_zone       = var.private_subnet_03_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.private_subnet_03_availability_zone}-private-subnet-03"
  }
}

resource "aws_subnet" "public_subnet_01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_01_cidr

  availability_zone = var.public_subnet_01_availability_zone

  tags = {
    Name = "${var.public_subnet_01_availability_zone}-public-subnet-01"
  }
}

resource "aws_subnet" "public_subnet_02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_02_cidr

  availability_zone = var.public_subnet_02_availability_zone

  tags = {
    Name = "${var.public_subnet_02_availability_zone}-public-subnet-02"
  }
}

resource "aws_subnet" "public_subnet_03" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_03_cidr

  availability_zone = var.public_subnet_03_availability_zone

  tags = {
    Name = "${var.public_subnet_03_availability_zone}-public-subnet-03"
  }
}

resource "aws_internet_gateway" "priya_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.priya_igw.id
  }

  tags = {
    Name = "${var.environment}-public-rt"
  }
}

resource "aws_route_table_association" "public_subnet_01_assoc" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_02_assoc" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_03_assoc" {
  subnet_id      = aws_subnet.public_subnet_03.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.environment}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_01" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_01.id

  tags = {
    Name = "${var.environment}-01-nat-gateway"
  }

  depends_on = [aws_internet_gateway.priya_igw]
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_01.id
  }

  tags = {
    Name = "${var.environment}-private-rt"
  }
}

resource "aws_route_table_association" "private_subnet_assoc" {
  subnet_id      = aws_subnet.private_subnet_01.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_assoc_02" {
  subnet_id      = aws_subnet.private_subnet_02.id
  route_table_id = aws_route_table.private_rt.id
}