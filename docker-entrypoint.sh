#!/bin/bash
cd /var/www/html
if [ ! -f ./wp-config.php ]; then
  echo 'Waiting for database...'
  sleep 20
  wp core download --allow-root
  wp core config --dbhost="$MYSQL_PORT_3306_TCP_ADDR" --dbuser=root --dbpass="$MYSQL_ENV_MYSQL_ROOT_PASSWORD" --dbname="$WORDPRESS_DB" --allow-root
  wp db create --allow-root
  wp core multisite-install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASS" --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root
  mv /home/.htaccess /var/www/html
fi
apache2 -D FOREGROUND
