#!/usr/bin/env bash
set -e

echo "🚀 Starting Penguin Harness via Docker Compose..."

mkdir -p data workspace
chmod -R 777 data workspace 2>/dev/null || true

docker compose up -d --build

echo ""
echo "=============================================================="
echo "✅ Penguin Harness 已启动！"
echo "🌐 Web 访问地址: http://localhost:7364"
echo "🔑 查看首次启动初始管理员密码，请执行: docker logs -f penguinh-web"
echo "=============================================================="
echo ""

docker logs -f penguinh-web
