#!/usr/bin/env bash

locale-gen pl_PL.UTF-8

apt-get update

apt-get -y upgrade

apt-get -y autoremove

