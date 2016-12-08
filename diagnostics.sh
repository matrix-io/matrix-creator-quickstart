#!/bin/bash

echo "Version" >> matrix-creator.log
echo "    [ uname ]        " $(uname -a) >> matrix-creator.log
echo "    [ node ]         " $(node -v) >> matrix-creator.log
echo "    [ npm ]          " $(npm -v) >> matrix-creator.log

echo "Proc Logs" >> matrix-creator.log
echo "    [ proc/version ] " $(cat /proc/version) >> matrix-creator.log
echo "    [ proc/cpuinfo ] " $(cat /proc/cpuinfo) >> matrix-creator.log

echo "Services" >> matrix-creator.log
echo "    [ malos ]        " $(ps aux | grep "[m]alos") >> matrix-creator.log
echo "    [ malos_eye ]    " $(ps aux | grep "[m]alos_eye") >> matrix-creator.log
