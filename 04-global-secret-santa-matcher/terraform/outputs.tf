output "api_endpoint" {
  description = "API Gateway endpoint URL for registering participants"
  value       = aws_apigatewayv2_api.api.api_endpoint
}