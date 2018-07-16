FROM debian:9

MAINTAINER Michail Safronov, ms1980@inbox.ru

RUN apt-get update

RUN apt-get install -y \
  nginx

RUN apt-get install -y \
  php-fpm \
  php-mysql \
  mariadb-client

RUN  mkdir /run/php && chown www-data:www-data /run/php

RUN apt-get install -y \
  git nano

RUN apt-get install -y \
  supervisor && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

RUN apt-get install -y \
  openssh-server && \
    mkdir /run/sshd

RUN apt-get clean

ADD conf/nginx/sites/default /etc/nginx/sites-available/default

ADD conf/supervisor.conf /etc/supervisor.conf
ADD conf/supervisor/conf.d /etc/supervisor/conf.d

CMD ["supervisord", "-c", "/etc/supervisor.conf"]
