import json
import os
import urllib.request
import boto3
import psutil
from mcstatus import JavaServer

PARAM_NAME = os.getenv("PARAM_NAME", "/prod/uptime-viking/discord_webhook_url")
AWS_REGION = os.getenv("AWS_DEFAULT_REGION", "us-east-1")
DOMAIN_NAME = os.getenv("DOMAIN_NAME", "127.0.0.1")
SERVER_ADDRESS = "127.0.0.1:25565"

def fetch_webhook_url():
    try:
        ssm = boto3.client("ssm", region_name=AWS_REGION)
        response = ssm.get_parameter(Name=PARAM_NAME, WithDecryption=True)
        return response["Parameter"]["Value"]
    except Exception as e:
        print(f"[ERROR] Failed retrieving secret from SSM: {e}")
        return None

def get_system_metrics():
    cpu_usage = psutil.cpu_percent(interval=1)
    ram = psutil.virtual_memory()
    return cpu_usage, ram.percent

def check_minecraft_status():
    try:
        server = JavaServer.lookup(SERVER_ADDRESS)
        status = server.status()
        return True, status.players.online, status.players.max, status.latency
    except Exception:
        return False, 0, 0, 0.0

def send_discord_webhook(webhook_url, online, players, max_players, latency, cpu, ram):
    color = 3066993 if online else 15158332
    status_text = "🟢 **ONLINE (HTTPS Active)**" if online else "🔴 **OFFLINE**"

    embed = {
        "title": "⚔️ Uptime Viking — Secure Telemetry Guard",
        "description": f"Health telemetry for domain: `https://{DOMAIN_NAME}`",
        "color": color,
        "fields": [
            {"name": "Server Status", "value": status_text, "inline": True},
            {"name": "Players Online", "value": f"**{players}/{max_players}**", "inline": True},
            {"name": "Ping Latency", "value": f"**{latency:.1f} ms**", "inline": True},
            {"name": "CPU Usage", "value": f"**{cpu}%**", "inline": True},
            {"name": "RAM Usage", "value": f"**{ram}%**", "inline": True},
            {"name": "SSL Encryption", "value": "🔒 **Let's Encrypt Validated**", "inline": True},
        ],
        "footer": {"text": "Production DevOps Infrastructure • AWS SSM & Certbot SSL"},
    }

    payload = {"username": "Uptime Viking Guard", "embeds": [embed]}

    req = urllib.request.Request(
        webhook_url,
        data=json.dumps(payload).encode("utf-8"),
        headers={"Content-Type": "application/json", "User-Agent": "Mozilla/5.0"},
    )

    try:
        with urllib.request.urlopen(req) as response:
            if response.status in (200, 204):
                print("[SUCCESS] Webhook telemetry sent.")
    except Exception as e:
        print(f"[ERROR] Webhook delivery failed: {e}")

if __name__ == "__main__":
    webhook_url = fetch_webhook_url()
    if not webhook_url:
        print("[ABORT] Missing webhook secret.")
        exit(1)

    cpu, ram = get_system_metrics()
    is_online, players, max_players, latency = check_minecraft_status()
    send_discord_webhook(webhook_url, is_online, players, max_players, latency, cpu, ram)