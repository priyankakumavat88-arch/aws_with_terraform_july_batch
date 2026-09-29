variable "instance_ami_id" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "subnet_id" {
  type    = string
  #default     = "subnet-08a2adc7d2f560e63" # Replace with your desired default subnet ID
}

variable "environment" {
  type    = string
  
}

variable "sg_name" {
  type    = string
  
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the security group will be created"
  
}

#variable "instance_count" {
#type        = number
#default     = 4 # Replace with your desired default instance count

#}

variable "associate_public_ip_address" {
  type    = bool
}

variable "key_name" {
  type    = string
  
}