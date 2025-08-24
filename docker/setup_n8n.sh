#!/bin/bash
set -e

echo "=== [1/5] Update system ==="
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl unzip git ca-certificates gnupg lsb-release

echo "=== [2/5] Install Docker ==="
curl -fsSL https://get.docker.com | sudo bash
sudo systemctl enable docker
sudo systemctl start docker
docker --version

echo "=== [3/5] Install Docker Compose ==="
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "=== [4/5] Setup n8n project with Ngrok container ==="
mkdir -p ~/n8n/data
cd ~/n8n

# Dockerfile untuk n8n
cat > Dockerfile <<'EOF'
FROM n8nio/n8n:1.107.2

ENV NODE_FUNCTION_ALLOW_EXTERNAL=fs

USER root
RUN apk add --no-cache ffmpeg
USER node
EOF

# docker-compose.yml
cat > docker-compose.yml <<'EOF'
version: '3.8'

services:
  n8n:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: n8n
    ports:
      - "5678:5678"
    user: root
    environment:
      - N8N_HOST=n8n
      - N8N_PORT=5678
      - WEBHOOK_URL=${NGROK_DOMAIN:-https://<your-ngrok-domain>}
      - N8N_TIMEZONE=Asia/Jakarta
      - GENERIC_TIMEZONE=Asia/Jakarta
    volumes:
      - ./data:/home/node/.n8n
    restart: unless-stopped

  ngrok:
    image: ngrok/ngrok:latest
    container_name: ngrok
    restart: unless-stopped
    command:
      - "http"
      - "n8n:5678"
      - "--domain=${NGROK_DOMAIN:-https://<your-ngrok-domain>}"
      - "--authtoken=<your ngrok token>"
EOF

echo "=== [5/5] Build & Run n8n + Ngrok ==="
sudo docker-compose up -d --build
sudo docker ps

echo "=== Setup finished ==="
echo "n8n is running at: http://<EC2-PUBLIC-IP>:5678"
echo "Ngrok tunnel is active at: ${NGROK_DOMAIN:-https://<your-ngrok-domain>}"
