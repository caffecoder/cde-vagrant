#!/usr/bin/env bash

apt-get -y install mariadb-server libmysqlclient-dev

mysql -u root -e "UPDATE mysql.user SET PLUGIN='' WHERE USER='root'; FLUSH PRIVILEGES;"

apt-get -y autoremove

