variable "instance_ami_id" {
  type        = string
  default     = "ami-01a00762f46d584a1" # Replace with your desired default AMI ID
}

variable "instance_type" {
  type        = string
  default     = "t3.micro" # Replace with your desired default instance type
}

variable "subnet_id" {
  type        = string
  #default     = "subnet-06491c301552308e7" # Replace with your desired default subnet ID
  default     = "subnet-08a2adc7d2f560e63" # Replace with your desired default subnet ID
}

variable "environment" {
  type        = string
  default     = "dev" # Replace with your desired default environment
}

#variable "instance_count" {
  #type        = number
  #default     = 4 # Replace with your desired default instance count

#}

variable "associate_public_ip_address" {
  type        = bool
  default     = true # Set to true if you want to associate a public IP address with the instance
}