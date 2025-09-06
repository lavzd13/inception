#!/bin/bash

if [ ! -d "/var/lib/mysql" ]; then
	cat > /tmp/init.sql <<EOF
	CREATE DATABASE IF NOT EXISTS ${MARIADB_NAME};
	CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
	CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
	GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USER}'@'%';
	FLUSH PRIVILEGES;
EOF
	exec mysqld_safe --init-file=/tmp/init.sql
else
	exec mysqld_safe
fi