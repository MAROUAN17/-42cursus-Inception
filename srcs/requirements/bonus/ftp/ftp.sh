#!/bin/bash

mkdir -p /var/run/vsftpd/empty;
chown root:root /var/run/vsftpd/empty;
chmod 755 /var/run/vsftpd/empty;

useradd -m maglagal;
echo "maglagal:maglagal123" | chpasswd

vsftpd;