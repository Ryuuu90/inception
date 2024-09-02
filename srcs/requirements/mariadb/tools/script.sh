#!/bin/bash


DB_NAME="inception"
DB_USER="rabou"
DB_PASS="12345"

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

# mysql -u root <<EOF
# CREATE DATABASE IF NOT EXISTS $DB_NAME;
# CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
# GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';
# FLUSH PRIVILEGES;
# EOF

# mysqladmin -u root -p"$DB_ROOT_PASS" shutdown

mysqld_safe
