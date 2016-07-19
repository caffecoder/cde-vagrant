#!/usr/bin/env bash

apt-get -y install postgresql libpq-dev

su - postgres -c "createuser -s cde-project"

hba1='host    all             cde-project     127.0.0.1/32            trust' 
hba2='local   all             cde-project                             trust'
pattern='# "local" is for Unix domain socket connections only'

sed -i "/$pattern/a $hba1" /etc/postgresql/9.5/main/pg_hba.conf
sed -i "/$pattern/a $hba2" /etc/postgresql/9.5/main/pg_hba.conf

systemctl reload postgresql.service

apt-get -y autoremove

