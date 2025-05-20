FROM debian:bullseye

COPY ./tools/entrypoint.sh entrypoint.sh

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server curl && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x ./entrypoint.sh && \
    apt-get clean

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ./entrypoint.sh
