#!/bin/bash

while ! nc -z wp 9000; do
	sleep 1;
done

touch /etc/ssl/openssl.cnf;

cat >> /etc/ssl/openssl.cnf <<EOF
[ req ]
prompt = no
distinguished_name = rq
string_mask = utf8only

[ rq ]
C = MA
ST = SA
L = SF
O = MC
OU = DT
CN = lh
emailAddress = admin@email.com
EOF

touch /etc/ssl/private/nginx-selfsigned.key;

touch /etc/ssl/certs/nginx-selfsigned.crt;

openssl req -new -x509 -config /etc/ssl/openssl.cnf -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

nginx -g 'daemon off;';

nginx -s reload;

