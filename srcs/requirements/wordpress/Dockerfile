FROM debian:11

RUN apt-get update -y && apt-get upgrade -y && apt install -y php7.4 php7.4-fpm php-mysql curl

COPY ./tools/script.sh .

WORKDIR /var/www/html

CMD ["/script.sh"]
