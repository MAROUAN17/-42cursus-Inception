#!/bin/bash

mkdir -p /var/run/vsftpd/empty;
chown root:root /var/run/vsftpd/empty;
chmod 755 /var/run/vsftpd/empty;

useradd -m ${FTP_USER};
echo "${FTP_USER}:${FTP_PASS}" | chpasswd

vsftpd;