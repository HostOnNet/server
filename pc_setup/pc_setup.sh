#!/bin/bash

# Used to setup web developer PC at HostOnNet.com

add-apt-repository ppa:webupd8team/sublime-text-3 -y

apt-get update
apt-get -y upgrade

#install required software

apt-get -y install wget
apt-get -y install curl
apt-get -y install nmap
apt-get -y install git git-gui
apt-get -y install sublime-text-installer

chown flashwebhost:flashwebhost /etc/hosts
chmod 777 /etc/hosts

apt-get -y install whois
apt-get -y install dnsutils
apt-get -y install gimp
apt-get -y install filezilla
apt-get -y install vim
apt-get -y install vino
apt-get -y install imagemagick

# Install chrome

/usr/bin/wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

if [ ! -f /etc/apt/sources.list.d/google-chrome.list ]; then
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
fi

apt-get -y install google-chrome-stable

sed -i 's/firefox.desktop/google-chrome.desktop/g' /etc/gnome/defaults.list

# Install Apachee

apt-get -y install apache2
update-rc.d apache2 enable
a2enmod rewrite

# Install PHP

apt-get -y install php5 php5-cli php5-curl php5-gd php5-mysql php5-imagick php5-imap php5-mcrypt php5-json
php5enmod mcrypt

/bin/sed -i "s/^display_errors = Off/display_errors = On/g" /etc/php5/apache2/php.ini
/bin/sed -i "s/^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/g" /etc/php5/apache2/php.ini

# Install MySQL 

apt-get -y install mysql-server-5.5

# Install phpMyAdmin

apt-get -y install phpmyadmin

# Restart Apache

service apache2 restart

# Downloading .vimrc

if [ ! -f /root/.vimrc ]; then
    /usr/bin/wget https://raw.githubusercontent.com/hostonnet/server/master/dotfiles/.vimrc -O /root/.vimrc
fi

if [ ! -f /usr/local/bin/composer ]; then
    cd /usr/local/bin
    curl -s https://getcomposer.org/installer | php
    mv composer.phar composer
    chmod +x composer
fi

echo "Finished"
