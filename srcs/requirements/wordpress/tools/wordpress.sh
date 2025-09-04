#!/bin/bash

if ! command -v wp >/dev/null 2>&1; then
	curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x /usr/local/bin/wp
fi

mkdir -p /var/www/html

rm -rf /var/www/html/*

wp core download --path=/var/www/html --allow-root

cp /wp-config.php /var/www/html/

wp core install --path=/var/www/html --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --path=/var/www/html --role=author --user_pass=$WP_USER_PASS --allow-root

chown -R www-data:www-data /var/www/html

echo 'clear_env = no' >> /etc/php/*/fpm/pool.d/www.conf

sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/*/fpm/pool.d/www.conf

php-fpm8.2 -F