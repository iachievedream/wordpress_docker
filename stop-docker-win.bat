@echo off
cd /d %~dp0

if not exist wordpress_https (
    echo [ERROR] wordpress_https 目錄不存在！
    pause
    exit /b
)
cd wordpress_https

:: 停止所有運行中的容器
for /f "tokens=*" %%i in ('docker ps -q') do docker stop %%i

:: 刪除所有容器
for /f "tokens=*" %%i in ('docker ps -a -q') do docker rm %%i

pause
