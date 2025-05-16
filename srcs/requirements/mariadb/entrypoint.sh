#!/bin/bash

mysqld_safe &

sleep 10;

mysql -u root  <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${MARIADB_DB_NAME};
    CREATE USER IF NOT EXISTS '${MARIADB_DB_USER}'@'%' IDENTIFIED BY '$(cat ${MARIADB_DB_PASSWORD})';
    GRANT ALL PRIVILEGES ON ${MARIADB_DB_NAME}.* TO '${MARIADB_DB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

mysqladmin shutdown;

mv ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

exec mysqld;
