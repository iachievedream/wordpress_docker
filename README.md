# README

## alias 快捷命令
alias docker='sudo docker'

## 啟動專案
~~~
cp .env.example .env

docker compose up -d
docker compose down

docker volume prune
~~~

## container 錯誤查看訊息
docker logs nginx
docker exec -it nginx bash

## wordpress_https
~~~
mkdir ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/localhost.key -out ssl/localhost.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"
~~~

## 使用 Certbot 申請憑證
~~~
docker exec certbot certonly --webroot \
  -w /usr/share/nginx/html \
  -d yourdomain.com -d www.yourdomain.com \
  --email your-email@example.com \
  --agree-tos \
  --no-eff-email

docker exec certbot certonly --webroot \
  -w /usr/share/nginx/html \
  -d $(grep DOMAIN .env | cut -d'=' -f2) -d www.$(grep DOMAIN .env | cut -d'=' -f2) \
  --email $(grep EMAIL .env | cut -d'=' -f2) \
  --agree-tos \
  --no-eff-email

docker compose run certbot certonly --webroot --webroot-path=/var/www/certbot -d ${DOMAIN} -d www.${DOMAIN}

docker compose run certbot certonly --webroot --webroot-path=/var/www/certbot -d ${DOMAIN} -d www.${DOMAIN} --email ${EMAIL} --agree-tos --no-eff-email
~~~

## 手動備份指令
~~~
# 進入container
docker exec -it mysql bash
# 還原資料庫
mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /backups/wordpress.sql
# 備份資料庫
mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > /backups/wordpress.sql

# 備份資料庫(時間區隔)
mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > /backups/db_backup_$(date +%Y-%m-%d_%H-%M-%S).sql
~~~

## 專案分層


## 安裝有小工具的套件
Twenty Twenty-One

## git commit
~~~
feat: add docker-compose
feat: Initial commit for WordPress project
chore: update README
feat: add user for blog
feat: install themes of Twenty Twenty-One
feat: back mysql data
feat: add plugins
~~~

## 參考資料
[【架站筆記】管理Cloudflare API tokens和keys](https://abigalefocus.medium.com/%E6%9E%B6%E7%AB%99%E7%AD%86%E8%A8%98-%E7%AE%A1%E7%90%86cloudflare-api-tokens%E5%92%8Ckeys-1bd6ad24883e)

[CloudFlare 免費服務＆ WordPress 外掛教學](https://host.com.tw/cloudflare)
