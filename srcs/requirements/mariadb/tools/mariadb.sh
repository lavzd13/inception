#!/bin/bash

set -e

mysqld_safe &

until mysqladmin ping -h localhost --silent; do
	sleep 1
done

mysql -u root -p"$MARIADB_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS ${MARIADB_NAME};
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$MARIADB_ROOT_PASSWORD" shutdown

exec mysqld_safe