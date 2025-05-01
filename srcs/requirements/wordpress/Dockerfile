FROM debian:bullseye

COPY wp-config.php /var/www/html/wp-config.php
COPY wp.sh /usr/local/bin/wp.sh

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    default-mysql-client \
    php7.4 \
    php-fpm \
    php7.4-mysql \
    curl && \
    chmod +x /usr/local/bin/wp.sh && \
    mkdir -p /run/php && \
    ln -s /usr/sbin/php-fpm7.4 /usr/sbin/php-fpm && \
    curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN sed -i 's|^listen = .*|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp.sh"]