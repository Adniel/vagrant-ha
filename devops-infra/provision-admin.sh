#!/bin/bash

# We'll want to provision the Puppet Master with a shell script

export DEBIAN_FRONTEND=noninteractive

apt-get -qq update

# Puppet Master
apt-get -qqy install puppetmaster

# RunDeck
wget 'http://download.rundeck.org/deb/rundeck-1.6.1-1-GA.deb'
dpkg -i 'rundeck-1.6.1-1-GA.deb'


