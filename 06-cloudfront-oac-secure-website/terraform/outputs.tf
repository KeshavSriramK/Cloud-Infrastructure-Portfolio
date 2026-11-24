output "cloudfront_domain_name" {
  description = "The secure CloudFront HTTPS URL for your website"
  value       = "https://${aws_cloudfront_distribution.cdn.domain_name}"
}