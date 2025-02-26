@echo off
cd /d %~dp0
cd wordpress_https
cp .env.example .env

docker stop $(docker ps -q) && docker rm $(docker ps -a -q)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/localhost.key -out ssl/localhost.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

docker compose up -d
pause
