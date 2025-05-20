FROM debian:bullseye

COPY ./tools/ftp.sh /usr/local/bin/ftp.sh

RUN chmod +x /usr/local/bin/ftp.sh && \
    apt-get update && \
    apt-get install -y vsftpd ftp && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 

RUN sed -i 's|listen=NO|listen=YES|' /etc/vsftpd.conf
RUN sed -i 's|listen_ipv6=YES|listen_ipv6=NO|' /etc/vsftpd.conf
RUN sed -i 's|#write_enable=YES|write_enable=YES|' /etc/vsftpd.conf
RUN echo "xferlog_enable=YES" >> /etc/vsftpd.conf
RUN echo "log_ftp_protocol=YES" >> /etc/vsftpd.conf
RUN echo "pasv_enable=YES" >> /etc/vsftpd.conf
RUN echo "pasv_max_port=10100" >> /etc/vsftpd.conf
RUN echo "pasv_min_port=10090" >> /etc/vsftpd.conf
RUN echo "pasv_address=$(hostname -I | awk '{print $1}')" >> /etc/vsftpd.conf
RUN echo "local_root=/var/www/html" >> /etc/vsftpd.conf

EXPOSE 21 10090-10100

ENTRYPOINT /usr/local/bin/ftp.sh
