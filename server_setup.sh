#!/bin/bash

echo "Updating system...."

yum update -y

echo "Installing basic system tools"

yum install -y nmap lynx wget curl telnet screen jwhois

echo "Installing build tools"

yum install -y ncurses-devel automake autoconf gcc gmake patch make
yum install -y libcpp libgcc libstdc++ gcc4 gcc4-c++ gcc4-gfortran
yum install -y dos2unix libtool gcc-c++ gcc-c++ compat-gcc-32 compat-gcc-32-c++


