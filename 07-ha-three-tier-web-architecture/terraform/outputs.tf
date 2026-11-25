output "alb_dns_name" {
  value = "http://${aws_lb.web.dns_name}"
}