FROM debian:9

MAINTAINER Michail Safronov, ms1980@inbox.ru

RUN apt-get update

RUN apt-get install -y \
  mariadb-server

RUN apt-get install -y \
  supervisor && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

RUN apt-get install -y less procps nano

RUN  apt-get clean

COPY conf/mysql/mariadb.conf.d /etc/mysql/mariadb.conf.d

RUN mkdir /scripts 
COPY scripts /scripts

ADD conf/supervisor.conf /etc/supervisor.conf
ADD conf/supervisor/conf.d /etc/supervisor/conf.d

CMD ["supervisord", "-c", "/etc/supervisor.conf"]
