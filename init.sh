#!/bin/bash

sudo apt-get --yes --force-yes install php5
sudo apt-get --yes --force-yes install npm
sudo apt-get --yes --force-yes install terminator
sudo apt-get --yes --force-yes install software-center

#Install JAVA
sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
sudo apt-get update
sudo apt-get install oracle-java8-installer

sudo dpkg -i atom-amd64.deb

npm install -g gulp