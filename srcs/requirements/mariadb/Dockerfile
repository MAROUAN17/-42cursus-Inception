FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean


EXPOSE 9000

CMD ["php-fpm7.3", "-F"]