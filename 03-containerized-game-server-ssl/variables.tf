variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "discord_webhook_url" {
  type      = string
  sensitive = true
}

variable "duckdns_domain" {
  type = string
}

variable "duckdns_token" {
  type      = string
  sensitive = true
}

variable "cert_email" {
  type = string
}