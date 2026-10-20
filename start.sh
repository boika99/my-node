#!/bin/sh
cat > /config.json <<EOF
{
  "inbounds": [{
    "port": ${PORT:-8080},
    "protocol": "vless",
    "settings": {
      "clients": [{"id": "${UUID}"}],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {"path": "${WS_PATH:-/ray}"}
    }
  }],
  "outbounds": [{"protocol": "freedom"}]
}
EOF
exec xray run -config /config.json
