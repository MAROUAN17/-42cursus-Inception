FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    nginx \
    openssl \
    curl \
    netcat \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*


COPY ./tools/ssl.sh /usr/local/bin/ssl.sh
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/ssl.sh"]
