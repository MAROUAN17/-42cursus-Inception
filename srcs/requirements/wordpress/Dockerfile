FROM debian:bullseye

COPY ./tools/wp.sh /usr/local/bin/wp.sh

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
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \ 
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean


RUN sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp.sh"]
