# README
## 啟動專案 wordpress_https
~~~
cd wordpress_https
cp .env.example .env

自簽名憑證生成 (簡單方式)，執行以下指令來生成自簽名憑證：
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/localhost.key -out ssl/localhost.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

docker compose up -d

docker compose down
docker volume prune
~~~

## container 錯誤查看訊息
docker logs nginx
docker logs wordpress
docker logs certbot
docker exec -it nginx bash
docker exec -it wordpress bash

## 使用 Certbot 申請憑證

使用 Certbot 獲取正式憑證
執行以下指令來獲取正式的 SSL 憑證：
~~~bash
docker compose run --rm certbot certonly --webroot -w /var/www/certbot -d $DOMAIN --email $EMAIL --agree-tos --no-eff-email --force-renewal
~~~

Certbot 會將憑證存放於 ssl/ 資料夾下。

## 備註

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

## chatgpt

我使用AWS做為雲主機
domain 為 charleyfu.us.kg

使用的方式是使用 .env 的參數將 domain帶入

.env的參數如下
DOMAIN=charleyfu.us.kg
EMAIL=your-email@example.com

WORDPRESS_DB_HOST=mysql:3306
WORDPRESS_DB_USER=root
WORDPRESS_DB_PASSWORD=example_password
WORDPRESS_DB_NAME=wordpress
MYSQL_ROOT_PASSWORD=example_password
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress_user
MYSQL_PASSWORD=wordpress_password

使用的環境為：
nginx：需要使用ssl的憑證，使用default.conf.template形成所需的default.conf，對應 .env 的 domain 的部分

給我一份比較單純的openssl做憑證的，
也給我另一個比較正式certonly做憑證。

wordpress：volumes的專案需要掛載在根資料夾當中

給我完整的docker-compose.yml設定檔，
以及其他必須的程式碼內容嗎？
