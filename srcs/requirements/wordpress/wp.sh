#!/bin/bash

mv wordpress/* /var/www/html/;
rmdir wordpress;
chown -R www-data:www-data /var/www/html;
php-fpm -F;