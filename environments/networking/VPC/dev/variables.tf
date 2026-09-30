variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  
}

variable "aws_vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}


variable "environment" {
  description = "The environment for the VPC (e.g., dev, staging, prod)."
  type        = string
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support for the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames for the VPC."
  type        = bool
  default     = true
}

variable "public_subnet_01_cidr" {
  description = "The CIDR block for the public subnet 01."
  type        = string
}

variable "public_subnet_01_availability_zone" {
  description = "The availability zone for the public subnet 01."
  type        = string
}
variable "private_subnet_01_cidr" {
  description = "The CIDR block for the private subnet 01."
  type        = string
}

variable "private_subnet_01_availability_zone" {
  description = "The availability zone for the private subnet 01."
  type        = string
}
