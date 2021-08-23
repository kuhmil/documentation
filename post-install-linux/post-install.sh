#!/bin/bash
#yes Yes | ./post-install.sh
#Finding pi with ethernet plugged in: ping raspberrypi.local
#Add ssh.txt file to boot drive (headless install)
#ssh pi@(address found)
#Once logged into raspberry pi change the passowrd: passwd
#Then run this script for the basics

#necessary
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install rpi.gpio
sudo apt-get install sqlite3
sudo apt install net-tools
sudo systemctl status ssh
sudo apt-get install openssh-server
sudo apt-get -y install python3-pip
pip3 --version
pip3 install Flask
pip3 install flask
python3 -m flask --version
#hardware
sudo apt-get install rpi.gpio
sudo modprobe w1-gpio
sudo modprobe w1-therm
#yes Yes | ./post-install.sh
# Web server install
sudo apt-get install apache2
sudo apt-get install php
sudo apt-get install mariadb-server php-mysql
sudo service apache2 restart
sudo apt-get update
