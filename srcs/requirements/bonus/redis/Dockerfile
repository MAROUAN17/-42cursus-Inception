FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y redis-server redis-tools && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

COPY ./conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD redis-server /etc/redis/redis.conf
