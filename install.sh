#!/bin/bash
# setup & installation
echo '\n\n'
echo '---------------------------------'
echo 'Installing MATRIX Dependencies...'
echo '---------------------------------'
echo '\n'
echo "deb http://packages.matrix.one/matrix-creator/ ./" | sudo tee --append /etc/apt/sources.list;
sudo apt-get update;
sudo apt-get upgrade;
sudo apt-get -y install git;
sudo apt-get -y install libzmq3-dev;

sudo apt-get -y install g++;
sudo apt-get -y install xc3sprog wiringpi cmake;

# creator code needs force until it can be authenticated
sudo apt-get -y --force-yes install malos-eye matrix-creator-malos matrix-creator-openocd matrix-creator-init;

# Install npm (doesn't really matter what version, apt-get node is v0.10...)
sudo apt-get -y install npm;

# n is a node version manager
sudo npm install -g n;

# node 6.7 is the latest target node version, also installs new npm
sudo n 6.7.0;

# install matrix os
echo '\n\n'
echo '---------------------------------'
echo 'Installing MATRIX API Services...'
echo '---------------------------------'
echo '\n'
git clone https://github.com/matrix-io/matrix-os.git;
cd matrix-os;
git submodule update --init;
npm install;

npm rebuild;

# Reboot!
echo '\n\n'
echo '---------------------------------'
echo 'Rebooting... Please re-connect to'
echo ' your Raspberry Pi in a minute.  '
echo '---------------------------------'
echo '\n'
sudo reboot;
