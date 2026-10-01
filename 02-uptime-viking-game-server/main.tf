data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_ssm_parameter" "discord_webhook" {
  name        = "/${var.environment}/uptime-viking/discord_webhook_url"
  description = "Encrypted Discord Webhook URL"
  type        = "SecureString"
  value       = var.discord_webhook_url
}

resource "aws_security_group" "game_sg" {
  name        = "${var.environment}-uptime-viking-sg"
  description = "Security group for HTTPS and Minecraft"

  ingress {
    description = "HTTP Traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Minecraft Server"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "ec2_ssm_role" {
  name = "${var.environment}-uptime-viking-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy" "read_webhook_secret" {
  name = "ReadDiscordWebhookSecret"
  role = aws_iam_role.ec2_ssm_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["ssm:GetParameter"]
      Resource = aws_ssm_parameter.discord_webhook.arn
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.environment}-uptime-viking-profile"
  role = aws_iam_role.ec2_ssm_role.name
}

resource "aws_instance" "game_server" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.id

  vpc_security_group_ids = [aws_security_group.game_sg.id]

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  user_data = <<-EOF
              #!/bin/bash
              set -e

              apt-get update -y
              apt-get install -y docker.io python3-pip cron nginx certbot python3-certbot-nginx curl awscli

              systemctl enable --now docker
              systemctl enable --now nginx

              PUBLIC_IP=$(curl -s https://checkip.amazonaws.com)
              curl -s "https://www.duckdns.org/update?domains=${var.duckdns_domain}&token=${var.duckdns_token}&ip=$PUBLIC_IP"

              (crontab -l 2>/dev/null; echo "*/30 * * * * curl -s \"https://www.duckdns.org/update?domains=${var.duckdns_domain}&token=${var.duckdns_token}&ip=\$(curl -s https://checkip.amazonaws.com)\" >/dev/null 2>&1") | crontab -

              docker run -d \
                --name minecraft-server \
                -p 25565:25565 \
                -e EULA=TRUE \
                -e MEMORY=2G \
                --restart always \
                itzg/minecraft-server

              cat << 'NGINXEOF' > /etc/nginx/sites-available/default
              server {
                  listen 80;
                  server_name ${var.duckdns_domain};

                  location / {
                      return 200 '{"status":"online", "server":"Uptime Viking", "domain":"${var.duckdns_domain}"}';
                      add_header Content-Type application/json;
                  }
              }
              NGINXEOF

              systemctl reload nginx

              certbot --nginx -d ${var.duckdns_domain} --non-interactive --agree-tos -m ${var.cert_email} --redirect

              pip3 install requests mcstatus psutil boto3

              cat << 'PYEOF' > /opt/monitor.py
              ${file("${path.module}/monitor.py")}
              PYEOF

              echo "PARAM_NAME=/${var.environment}/uptime-viking/discord_webhook_url" >> /etc/environment
              echo "AWS_DEFAULT_REGION=${var.aws_region}" >> /etc/environment
              echo "DOMAIN_NAME=${var.duckdns_domain}" >> /etc/environment

              (crontab -l 2>/dev/null; echo "*/5 * * * * . /etc/environment; /usr/bin/python3 /opt/monitor.py >> /var/log/uptime_viking.log 2>&1") | crontab -
              EOF

  tags = {
    Name        = "${var.environment}-uptime-viking-server"
    Environment = var.environment
  }
}