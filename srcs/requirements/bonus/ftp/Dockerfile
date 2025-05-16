FROM debian:bullseye

COPY ftp.sh /usr/local/bin/ftp.sh

RUN chmod +x /usr/local/bin/ftp.sh && \
    apt-get update && \
    apt-get install -y vsftpd ftp && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 

EXPOSE 21 10090-10100

ENTRYPOINT /usr/local/bin/ftp.sh
