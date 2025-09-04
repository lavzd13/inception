# Start from a lightweight Linux base
FROM debian:bookworm

RUN apt -y update && apt install -y nginx && apt install openssl -y

COPY conf/my-conf.conf /

COPY tools/nginx.sh /

CMD ["/nginx.sh"]