# README

## 啟動專案
~~~
cp .env.example .env

docker compose up -d
docker compose down

docker volume prune

## wordpress_https
mkdir ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/localhost.key -out ssl/localhost.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"
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
