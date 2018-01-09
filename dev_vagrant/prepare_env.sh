#!/usr/bin/env bash

sed -i -e 's/# pl_PL.UTF-8 UTF-8/pl_PL.UTF-8 UTF-8/' /etc/locale.gen

locale-gen pl_PL.UTF-8

timedatectl set-timezone Europe/Warsaw

apt-get update

apt-get -y upgrade

apt-get -y autoremove

apt-get install -y dirmngr
apt-get install -y curl
