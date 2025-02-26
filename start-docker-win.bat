@echo off
cd /d %~dp0
if not exist wordpress_https (
    echo [ERROR] wordpress_https 目錄不存在！
    pause
    exit /b
)
cd wordpress_https

if not exist .env (
    copy .env.example .env
)

:: 停止並移除所有運行中的容器
for /f "tokens=*" %%i in ('docker ps -q') do docker stop %%i
for /f "tokens=*" %%i in ('docker ps -a -q') do docker rm %%i

:: 檢查 OpenSSL 是否可用
where openssl >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] OpenSSL 未安裝或未加入環境變數！
    pause
    exit /b
)

:: 生成 SSL 憑證
mkdir ssl 2>nul
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/localhost.key -out ssl/localhost.crt ^
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

:: 啟動 Docker Compose
docker compose up -d

pause
