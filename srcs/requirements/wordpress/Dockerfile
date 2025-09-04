FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl wget unzip tar git php php-mysql php-fpm

RUN set -e

COPY conf/wp-config.php /

COPY tools/wordpress.sh /

ENTRYPOINT ["/wordpress.sh"]