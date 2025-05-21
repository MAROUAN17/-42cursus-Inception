#!/bin/bash


#mysqld_safe &

mkdir -p /run/mysql
chown mysql:mysql /run/mysql

mysql_install_db --user=mysql

mysqld_safe & 

sleep 5;

mysql -u root <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat ${MARIADB_DB_ROOT_PASSWORD})';
    CREATE DATABASE IF NOT EXISTS ${MARIADB_DB_NAME};
    CREATE USER IF NOT EXISTS '${MARIADB_DB_USER}'@'%' IDENTIFIED BY '$(cat ${WORDPRESS_USER_PASSWORD})';
    GRANT ALL PRIVILEGES ON ${MARIADB_DB_NAME}.* TO '${MARIADB_DB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

mysqladmin shutdown;


exec mysqld;
