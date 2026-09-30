variable "instance_ami_id" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "environment" {
  type        = string
  default     = "dev" # Replace with your desired default environment
}

variable "aws_region" {
  type        = string
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
}
