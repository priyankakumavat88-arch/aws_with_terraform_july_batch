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
  type = string
}

variable "public_subnet_01_availability_zone" {
  type = string
}

variable "private_subnet_01_cidr" {
  type = string
}

variable "private_subnet_01_availability_zone" {
  type = string
}

variable "public_subnet_02_cidr" {
  type = string
}

variable "public_subnet_02_availability_zone" {
  type = string
}

variable "public_subnet_03_cidr" {
  type = string
}

variable "public_subnet_03_availability_zone" {
  type = string
}

variable "private_subnet_02_cidr" {
  type = string
}

variable "private_subnet_02_availability_zone" {
  type = string
}

variable "private_subnet_03_cidr" {
  type = string
}

variable "private_subnet_03_availability_zone" {
  type = string
}

variable "eip_name" {
  type = string
}
