#!/bin/sh

# Keep  clean

RUN apt-get update && apt-get install -y mysql-server && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

/usr/sbin/mysqld &
sleep 5
RUN echo "CREATE DATABASE liferay"

RUN echo "GRANT ALL ON *.* TO mgaya@'%' IDENTIFIED BY 'mgaya' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
