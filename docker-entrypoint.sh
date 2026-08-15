#!/usr/bin/env bash
set -e

# 加载可能的所有 bin 路径
export PATH="/usr/local/bin:/usr/bin:/home/penguin/.local/bin:/home/penguin/.penguin/bin:/home/penguin/bin:$PATH"

echo "=================================================="
echo " Starting Penguin Harness (penguinh) Web Server..."
echo " Web UI Port: 7364"
echo " Initial Admin Password will be shown below on first run"
echo "=================================================="

# 查找 penguin 真实绝对路径
PENGUIN_BIN=$(which penguin 2>/dev/null || find /home/penguin -name penguin -type f 2>/dev/null | head -n 1 || echo "penguin")

if [ "$1" = "penguin" ] && [ "$2" = "web" ]; then
    exec "$PENGUIN_BIN" web --host 0.0.0.0 --port 7364
fi

exec "$@"
