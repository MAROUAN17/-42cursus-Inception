#!/bin/bash

mysqld_safe &

sleep 10

mysql -u root  <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`wp_db\`;
    CREATE USER IF NOT EXISTS 'maglagal'@'%' IDENTIFIED BY 'maglagal123';
    GRANT ALL PRIVILEGES ON \`wp_db\`.* TO 'maglagal'@'%';
    FLUSH PRIVILEGES;
EOSQL

wait $!