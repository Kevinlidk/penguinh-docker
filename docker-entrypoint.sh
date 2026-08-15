#!/usr/bin/env bash
set -e

export PATH="/usr/local/bin:/usr/bin:/home/node/.local/bin:/home/node/.penguin/bin:/home/node/bin:$PATH"

mkdir -p /home/node/.penguin /home/node/workspace

echo "=================================================="
echo " Starting Penguin Harness (penguinh) Web Server..."
echo " Web UI Port: 7364"
echo " Initial Admin Password will be shown below on first run"
echo "=================================================="

PENGUIN_BIN=$(which penguin 2>/dev/null || find /home/node -name penguin -type f 2>/dev/null | head -n 1 || echo "penguin")

if [ "$1" = "penguin" ] && [ "$2" = "web" ]; then
    exec "$PENGUIN_BIN" web --host 0.0.0.0 --port 7364
fi

exec "$@"
