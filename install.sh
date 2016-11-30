#!/bin/bash
# setup & installation
echo '\n\n'
echo '---------------------------------'
echo 'Installing MATRIX Dependencies...'
echo '---------------------------------'
echo "deb http://packages.matrix.one/matrix-creator/ ./" | sudo tee --append /etc/apt/sources.list;
sudo apt-get update;
sudo apt-get upgrade;
sudo apt-get -y install libzmq3-dev xc3sprog malos-eye matrix-creator-malos matrix-creator-openocd wiringpi matrix-creator-init cmake g++ git;

# Install npm (doesn't really matter what version, apt-get node is v0.10...)
sudo apt-get -y install npm

# n is a node version manager
sudo npm install -g n

# node 6.5 is the latest target node version, also installs new npm
sudo n 6.5

# install matrix os
echo '\n\n'
echo '---------------------------------'
echo 'Installing MATRIX API Services...'
echo '---------------------------------'
git clone https://github.com/matrix-io/matrix-os.git;
cd matrix-os;
git submodule update --init;
npm install;

# Reboot!
echo 'Rebooting. Please reconnect to your Raspberry Pi.'
sudo reboot;
