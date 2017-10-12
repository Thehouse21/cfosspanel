#!/bin/bash

apt-get upgrade -y --force-yes 
echo "Done"
echo "Installing FOS Prerequisites..."
apt-get install php5-cli php5-curl curl zip unzip sudo nano dialog apt-utils python-software-properties apt lsb-release -y 
echo "Done"

chmod 777 /tmp 
rm -rf ~/bin  
rm -rf ~/ffmpeg*  
cd /tmp 
rm -rf /tmp/* 
echo "FOS-Streaming -> Web Platform"
wget -q https://raw.githubusercontent.com/haco1971/IPTV-MD/master/install_panel.php -O install_panel.php 
/usr/bin/php install_panel.php
echo "FOS-Streaming -> Database Deployment"
wget -q https://raw.githubusercontent.com/haco1971/IPTV-MD/master/db_install.sh -O db_install.sh  
chmod 755 db_install.sh 
./db_install.sh
if [ ! -f /usr/bin/ffmpeg ]; then
echo "FOS-Streaming -> FFmpeg and FFprobe installation"
wget -q https://raw.githubusercontent.com/haco1971/IPTV-MD/master/ffmpeg.sh -O ffmpeg.sh 
chmod 755 ffmpeg.sh 
./ffmpeg.sh
fi
