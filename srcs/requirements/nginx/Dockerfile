FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    nginx \
    openssl \
    curl \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*


COPY ssl.sh /usr/local/bin/ssl.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-available/default
COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/ssl.sh"]