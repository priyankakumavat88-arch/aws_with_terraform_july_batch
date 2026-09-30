output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnet_01_id" {
    value = aws_subnet.public_subnet_01.id
}

output "private_subnet_01_id" {
    value = aws_subnet.private_subnet_01.id
}

output "internet_gateway_id" {
    value = aws_internet_gateway.priya_igw.id
}