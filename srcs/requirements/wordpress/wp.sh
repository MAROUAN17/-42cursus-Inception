#!/bin/bash


cd /var/www/html;

wp core download --allow-root;

wp config create --dbhost=${MARIADB_DB_HOST} \
                 --dbname=${MARIADB_DB_NAME} \
                 --dbuser=${MARIADB_DB_USER} \
                 --dbpass="$(cat "${MARIADB_DB_PASSWORD}")" \
                 --allow-root \
                 --path='/var/www/html/';

wp core install --url=https://localhost \
                --title=${WORDPRESS_WEBSITE_TITLE} \
                --admin_user=${WORDPRESS_USER} \
                --admin_password="$(cat "${WORDPRESS_USER_PASSWORD}")" \
                --admin_email=${WORDPRESS_USER_EMAIL} \
                --allow-root;


wp plugin install redis-cache --activate --allow-root --path='/var/www/html/'
wp config set WP_REDIS_HOST redis --allow-root --path='/var/www/html/'
wp config set WP_REDIS_PORT 6379 --allow-root --path='/var/www/html/'
wp config set WP_CACHE true --allow-root
wp redis enable --allow-root --path='/var/www/html/'

wp config set WP_DEBUG true --raw --type=constant --allow-root
wp config set WP_DEBUG_LOG true --raw --type=constant --allow-root


php-fpm -F;