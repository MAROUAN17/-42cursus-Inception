FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    mkdir -p /var/www/html

COPY main.html /var/www/html/index.html
COPY style.css /var/www/html/style.css
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8081

CMD nginx -g 'daemon off;'