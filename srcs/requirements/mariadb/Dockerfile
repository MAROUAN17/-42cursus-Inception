FROM debian:buster

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/local/bin/entrypoint.sh && \
    apt-get clean

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]