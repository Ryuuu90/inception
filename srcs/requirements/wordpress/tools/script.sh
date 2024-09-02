#!/bin/bash
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 
mkdir -p /run/php
sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf
wp core download --allow-root
wp config create --allow-root --dbname="inception" --dbuser="rabou" --dbpass="12345" --dbhost="mariadb" 
wp core install --allow-root --url="rabou-rk.42.fr" --title="raboupage" --admin_user="rabou-rk" --admin_password="12345" --admin_email="khair.din.2020@gmail.com" --skip-email 
wp user create --allow-root --role=author "user"  "user@gmail.com" --user_pass="0000"

php-fpm7.4 -F