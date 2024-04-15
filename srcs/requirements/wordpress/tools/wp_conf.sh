#!/bin/sh

# Script to configure and install wordpress using wp-cli, and then start PHP-FPM

echo "Wait for MariaDB\n"
sleep 20

# Check if wp-config exists is already installed
if [ ! -f wp-config.php ]
then
	echo "Wordpress configuration\n"
	wp core config \
		--dbhost=mariadb:3306 \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--allow-root
	wp core install \
		--title=$WP_TITLE \
		--admin_user=$WP_USERNAME \
		--admin_password=$WP_PASSWORD \
		--admin_email=$WP_EMAIL \
		--url=$WP_URL \
		--allow-root
fi

# Start PHP-FPM in the foreground
echo "starting php-fpm\n"
exec /usr/sbin/php-fpm7.4 -F
