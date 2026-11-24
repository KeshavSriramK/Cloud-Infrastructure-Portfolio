# 06 - Secure Static Website with CloudFront + OAC (Terraform)

A static website served over HTTPS through Amazon CloudFront from a **private** S3 bucket, using Origin Access Control (OAC). The bucket has no public access. Only CloudFront can read from it.

## Architecture
User -> CloudFront (HTTPS) -> OAC (SigV4) -> Private S3 bucket

## Resources created
- S3 bucket (private)
- S3 public access block (all four settings on)
- S3 object (index.html)
- CloudFront Origin Access Control
- CloudFront distribution (redirect HTTP to HTTPS)
- S3 bucket policy allowing only the CloudFront distribution

## Deploy
cd terraform
terraform init
terraform plan
terraform apply

## Verification
- CloudFront URL returns 200 OK
- Direct S3 URL returns 403 Forbidden

## Cleanup
terraform destroy

## What I learned
- Why OAC replaced the older Origin Access Identity (OAI)
- Locking an S3 bucket policy to a specific CloudFront distribution ARN
- Keeping a bucket private while still serving it publicly through a CDN