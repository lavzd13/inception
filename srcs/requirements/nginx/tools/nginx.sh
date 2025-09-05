#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTIFICATES -subj "/C=AT/L=VI/O=42Vienna/OU=student/CN=jlomic.42.fr"

cp /my-conf.conf /etc/nginx/sites-available/default

exec nginx -g "daemon off;"