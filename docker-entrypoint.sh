#!/usr/bin/env bash
set -e

export PATH="/home/penguin/.local/bin:/home/penguin/bin:$PATH"

echo "=================================================="
echo " Starting Penguin Harness (penguinh) Web Server..."
echo " Web UI Port: 7364"
echo " Initial Admin Password will be shown below on first run"
echo "=================================================="

if [ "$1" = "penguin" ] && [ "$2" = "web" ]; then
    exec penguin web --host 0.0.0.0 --port 7364
fi

exec "$@"
