@echo off
cd /d %~dp0
cd wordpress_https

docker stop $(docker ps -q) && docker rm $(docker ps -a -q)
pause
