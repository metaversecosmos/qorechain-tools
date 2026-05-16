#!/bin/bash

echo "🚀 QoreChain Light Node Auto Installer"

echo "[1] System update..."
sudo apt update && sudo apt upgrade -y

echo "[2] Installing dependencies..."
sudo apt install -y git curl wget

echo "[3] Installing Docker..."
if ! command -v docker &> /dev/null
then
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker $USER
fi

echo "[4] Downloading QoreChain Light Node..."
rm -rf qorechain-lightnode
git clone https://github.com/qorechain/qorechain-lightnode
cd qorechain-lightnode

echo "[5] Starting node..."
docker compose pull
docker compose up -d

echo "================================"
echo "✅ INSTALL COMPLETE"
echo "================================"
echo "Check logs:"
echo "docker logs -f qorechain-lightnode-ux"
