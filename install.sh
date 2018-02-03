#!/usr/bin/env bash
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

# bluetooth
sudo apt-get -y install libudev-dev bluetooth bluez blueman libusb-1.0-0-dev;

# auth bluetooth for node
sudo setcap cap_net_raw+eip $(eval readlink -f `which node`);

# creator code needs force until it can be authenticated
#sudo apt-get -y --force-yes install malos-eye
sudo apt-get -y --force-yes install matrixio-malos \
	matrixio-malos-wakeword \
	matrixio-malos-zigbee

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
