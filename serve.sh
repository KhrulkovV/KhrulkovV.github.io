#!/usr/bin/env bash
# Shape Optimizer - Local WiFi Server
# Each browser tab gets its own independent optimization session (all client-side).
#
# Usage:
#   ./serve.sh          # serves on port 8080
#   ./serve.sh 3000     # serves on custom port
#
# Dependencies: Python 3 (no pip packages needed -- everything runs in the browser)

set -euo pipefail

PORT="${1:-8080}"
DIR="$(cd "$(dirname "$0")" && pwd)"

# Get local IP for sharing on WiFi
LOCAL_IP=$(hostname -I 2>/dev/null | awk '{print $1}' || ipconfig getifaddr en0 2>/dev/null || echo "localhost")

echo "============================================"
echo "  Shape Optimizer Server"
echo "============================================"
echo ""
echo "  Serving from: $DIR"
echo "  Port:         $PORT"
echo ""
echo "  Local:   http://localhost:$PORT"
echo "  WiFi:    http://$LOCAL_IP:$PORT"
echo ""
echo "  Share the WiFi link with your team."
echo "  Each browser gets its own session."
echo ""
echo "  Press Ctrl+C to stop."
echo "============================================"

cd "$DIR"
python3 -m http.server "$PORT" --bind 0.0.0.0
