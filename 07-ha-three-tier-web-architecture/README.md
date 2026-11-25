# 07 - High-Availability 3-Tier Web Architecture (Terraform)

A fault-tolerant web architecture on AWS, defined entirely in Terraform.

## Architecture
Internet -> Application Load Balancer (public subnets, 2 AZs) -> Auto Scaling Group (private subnets, 2 AZs)

## Resources (22)
- VPC with 2 public and 2 private subnets across 2 Availability Zones
- Internet gateway, NAT gateway, and route tables
- Application Load Balancer, target group, and HTTP listener
- Security groups: the ALB accepts internet traffic; the servers accept traffic only from the ALB
- Launch template (Amazon Linux 2023, IMDSv2 required)
- Auto Scaling Group (min 2, max 4) with CPU target-tracking scaling

## Status
Validated with `terraform validate` and `terraform plan` (22 resources to add). Not deployed, to avoid hourly NAT gateway and ALB charges.

## Deploy
cd terraform
terraform init
terraform plan
terraform apply

## Known limitations / next steps
- HTTP only. HTTPS needs a domain, an ACM certificate, and an HTTPS listener.
- A single NAT gateway keeps cost down; production would use one per AZ.
- No database tier yet.

## Cleanup
terraform destroy