FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    mkdir -p /var/www/html

COPY index.html /var/www/html/index.html
COPY description.html /var/www/html/description.html
COPY about.html /var/www/html/about.html
COPY style.css /var/www/html/style.css
COPY main.js /var/www/html/main.js
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8081

CMD nginx -g 'daemon off;'