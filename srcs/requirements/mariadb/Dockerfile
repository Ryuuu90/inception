FROM debian:11

RUN apt-get -y update \
    && apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh .

CMD ["./script.sh"]
