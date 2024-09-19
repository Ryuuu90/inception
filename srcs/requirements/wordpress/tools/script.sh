#!/bin/bash
sleep 3
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 
mkdir -p /run/php
sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
wp core download --allow-root
wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST 
wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email 
wp user create --allow-root --role=author "$WP_USR"  "$WP_EMAIL" --user_pass="$WP_PWD"

php-fpm7.4 -F