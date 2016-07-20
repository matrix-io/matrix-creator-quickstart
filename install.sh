#!/bin/bash
echo "deb http://packages.matrix.one/matrix-creator/ ./" | sudo tee --append /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y xc3sprog matrix-creator-openocd wiringpi matrix-creator-init cmake g++ git --force-yes
