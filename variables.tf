variable "aws_region" {
  description = "AWS region to deploy the resources in."
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}
