FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    mkdir -p /var/www/html

COPY ./tools/index.html /var/www/html/index.html
COPY ./tools/description.html /var/www/html/description.html
COPY ./tools/about.html /var/www/html/about.html
COPY ./tools/style.css /var/www/html/style.css
COPY ./tools/main.js /var/www/html/main.js
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8081

CMD nginx -g 'daemon off;'
