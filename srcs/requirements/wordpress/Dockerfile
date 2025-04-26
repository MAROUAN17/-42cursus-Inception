FROM debian:bullseye

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y \
    php7.4 \
    php-fpm \
    php7.4-mysql \
    curl && \
    mkdir -p /run/php && \
    ln -s /usr/sbin/php-fpm7.4 /usr/sbin/php-fpm && \
    curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress/* . && \
    rmdir wordpress && \
    chown -R www-data:www-data /var/www/html && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN sed -i 's|^listen = .*|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD php-fpm -F