#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

#apt-get -qq update
apt-get -qqy install keepalived haproxy
cp /vagrant/keepalived-ha1.conf /etc/keepalived/keepalived.conf
/etc/init.d/keepalived restart
