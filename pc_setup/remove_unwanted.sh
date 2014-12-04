#/bin/bash

# This program will remove unwanted programs
# Only keep minimum required programs, so your PC will
# be more secure.

# If you use any of these programs, comment those lines.

apt-get -y remove pidgin pidgin-data


apt-get -y remove simple-scan
apt-get -y remove transmission transmission-common transmission-gtk
apt-get -y remove leafpad

