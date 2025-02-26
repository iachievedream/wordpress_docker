#!/bin/bash
cd "$(dirname "$0")"  # 进入脚本所在目录
cd wordpress_https
docker stop $(docker ps -q) && docker rm $(docker ps -a -q)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/localhost.key -out ssl/localhost.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

docker compose up -d
