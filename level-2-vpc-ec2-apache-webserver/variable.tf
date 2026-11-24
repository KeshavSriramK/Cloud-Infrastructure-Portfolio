variable "aws_region" {
    description = "AWS region to deploy resources in"
    type        = string
    default     = "us-east-1"
}

variable "environment" {
    description = "Environment name for taging"
    type        = string
    default     = "dev"
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro" #Free tier eligible instance type
}