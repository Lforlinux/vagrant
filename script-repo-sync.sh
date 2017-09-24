#!/bin/bash
#Docker Git-repo sync 

#download git-repo
wget -P /tmp  https://github.com/Lforlinux/nginx-docker-compose/archive/master.zip
wget -P /tmp  https://github.com/Lforlinux/nginx-docker/archive/master.zip
#unzip and place on home folder
unzip /tmp/master.zip -d /home/vagrant/
unzip /tmp/master.zip.1 -d /home/vagrant/
rm -rf /tmp/master*
