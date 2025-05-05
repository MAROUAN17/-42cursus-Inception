#!/bin/bash

cd /var/www/html;

wp core download --allow-root;

wp config create --skip-check \
                 --dbhost=mariadb:3306 \
                 --dbname=wp_db \
                 --dbuser=maglagal \
                 --dbpass=maglagal123 \
                 --allow-root \
                 --path="/var/www/html";

wp core install --url=localhost:8080 \
                --title=inception \
                --admin_user=maglagal \
                --admin_password=maglagal123 \
                --admin_email=clarion.agl@gmail.com \
                --allow-root;


wp plugin install redis-cache --activate --allow-root --path='/var/www/html/'
wp config set WP_REDIS_HOST redis --allow-root --path='/var/www/html/'
wp config set WP_REDIS_PORT 6379 --allow-root --path='/var/www/html/'
wp config set WP_CACHE true --allow-root
wp redis enable --allow-root --path='/var/www/html/'

php-fpm -F;