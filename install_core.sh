#!/bin/bash
# setup & installation
echo '\n\n'
echo '---------------------------------'
echo 'Installing MATRIX Dependencies...'
echo '---------------------------------'

curl https://apt.matrix.one/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.matrix.one/raspbian $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/matrixlabs.list

# Update packages and install
sudo apt-get update
sudo apt-get upgrade

sudo apt-get -y install git cmake g++;
sudo apt-get -y install libzmq3-dev;

# creator code needs force until it can be authenticated
sudo apt-get -y --force-yes install matrixio-malos \
	matrixio-malos-wakeword

echo '\n\n'
echo '---------------------------------'
echo 'Rebooting... Please re-connect to'
echo ' your Raspberry Pi in a minute.  '
echo '---------------------------------'
echo '\n'
sudo reboot;
