#!/bin/bash

set -e

# 读取 .env 文件
export $(grep -v '^#' .env | xargs)

mkdir -p ssl

if [ "$1" = "selfsigned" ]; then
    echo "🔧 生成自签名证书..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
      -keyout ssl/nginx.key -out ssl/nginx.crt \
      -subj "/CN=${DOMAIN}/O=${DOMAIN}"
elif [ "$1" = "certbot" ]; then
    echo "🔐 获取 Let's Encrypt 证书..."
    docker run --rm -v $(pwd)/ssl:/etc/letsencrypt \
      certbot/certbot certonly --standalone \
      -d "${DOMAIN}" --email "${EMAIL}" --agree-tos --non-interactive
else
    echo "❌ 需要指定参数: selfsigned 或 certbot"
    exit 1
fi
