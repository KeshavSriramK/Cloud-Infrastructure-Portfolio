output "server_public_ip" {
  value = aws_instance.game_server.public_ip
}

output "https_status_url" {
  value = "https://${var.duckdns_domain}"
}

output "minecraft_connection_string" {
  value = "${var.duckdns_domain}:25565"
}