#!/bin/bash

service mariadb start
sleep 2

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;" 
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" 
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS'"
mariadb -e "FLUSH PRIVILEGES;"
sleep 2

service mariadb stop
sleep 2


mysqld_safe
