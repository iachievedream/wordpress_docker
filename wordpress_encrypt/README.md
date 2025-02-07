# README

1. 使用 OpenSSL 生成自签名证书
#!/bin/bash

mkdir -p ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ssl/nginx.key -out ssl/nginx.crt \
  -subj "/CN=${DOMAIN}/O=${DOMAIN}"

2. 使用 Certbot 获取正式 SSL 证书
#!/bin/bash

mkdir -p ssl
docker run --rm -v $(pwd)/ssl:/etc/letsencrypt \
  certbot/certbot certonly --standalone \
  -d "${DOMAIN}" --email "${EMAIL}" --agree-tos --non-interactive

# 生成自签名证书
bash generate_ssl.sh selfsigned

# 使用 Certbot 获取正式证书
bash generate_ssl.sh certbot