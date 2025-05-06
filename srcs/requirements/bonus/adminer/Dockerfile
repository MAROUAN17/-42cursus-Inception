FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    wget \
    php7.4 && \
    mkdir -p /var/www/html/adminer && \
    wget https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    rm /var/www/html/index.html

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html/adminer"]