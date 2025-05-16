#!/bin/bash

mkdir -p /var/run/vsftpd/empty;
chown root:root /var/run/vsftpd/empty;
chmod 755 /var/run/vsftpd/empty;

sed -i 's|listen=NO|listen=YES|' /etc/vsftpd.conf
sed -i 's|listen_ipv6=YES|listen_ipv6=NO|' /etc/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "port_enable=YES" >> /etc/vsftpd.conf
echo "pasv_max_port=10100" >> /etc/vsftpd.conf
echo "pasv_min_port=10090" >> /etc/vsftpd.conf
echo "pasv_address=127.0.0.1" >> /etc/vsftpd.conf
echo "local_root=/var/www/html" >> /etc/vsftpd.conf
echo "pasv_addr_resolve=YES" >> /etc/vsftpd.conf

useradd -m ${FTP_USER};
echo "${FTP_USER}:$(cat "${FTP_PASS}")" | chpasswd

vsftpd /etc/vsftpd.conf;
