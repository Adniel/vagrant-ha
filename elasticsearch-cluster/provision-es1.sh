#!/bin/bash

try_apt_install() {
    dpkg -l "$1" | grep -q ^ii && return 1
    apt-get -qq update && apt-get -qq -y install "$@"
    return 0
}

export DEBIAN_FRONTEND=noninteractive

try_apt_install openjdk-7-jdk

wget --continue --quiet -O /tmp/elasticsearch-0.90.5.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.5.deb
dpkg -i /tmp/elasticsearch-0.90.5.deb

echo 'discovery.zen.ping.unicast.hosts: ["10.11.1.10", "10.11.1.11", "10.11.1.12"]' > /etc/elasticsearch/elasticsearch.yml
echo 'network.bind_host: ' `facter ipaddress_eth1` >> /etc/elasticsearch/elasticsearch.yml
echo 'network.host: ' `facter ipaddress_eth1` >> /etc/elasticsearch/elasticsearch.yml

/etc/init.d/elasticsearch restart
