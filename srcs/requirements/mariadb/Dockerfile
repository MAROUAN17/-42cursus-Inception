FROM debian:bullseye

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY my.cnf /etc/mysql/my.cnf
COPY 50-server.cnf ./50-server.cnf

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server curl && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/local/bin/entrypoint.sh && \
    apt-get clean

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]