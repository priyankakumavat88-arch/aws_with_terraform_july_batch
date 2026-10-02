variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment for the S3 bucket"
  type        = string
}

variable "aws_s3_bucket_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = string
}

variable "aws_s3_bucket_acl" {
  description = "The ACL to apply to the S3 bucket"
  type        = string
}