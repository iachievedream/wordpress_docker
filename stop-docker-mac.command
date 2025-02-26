#!/bin/bash
cd "$(dirname "$0")"  # 进入脚本所在目录
cd wordpress_https

docker stop $(docker ps -q) && docker rm $(docker ps -a -q)
