#!/bin/sh
#install LTE-Tools
#N4XWE 8-12-2021
#Visit http://www.


#Update the apt cache and upgrade the system packages to their latest versions
sudo apt update && sudo apt upgrade -y

#Download and install the dependencies
sudo apt -y install  cmake libncurses5-dev liblapack-dev libblas-dev \
libboost-thread-dev libboost-system-dev libitpp-dev librtlsdr-dev \
libfftw3-dev ||
	{ echo 'Dependency installation failed'; exit 1; }

#Install the udev rules that enable the rtl-sdr to be used as a USB device
sudo wget -O /etc/udev/rules.d/20-rtlsdr.rules https://raw.githubusercontent.com/osmocom/rtl-sdr/master/rtl-sdr.rules

#Create a unique directory for the LTE-Tools compile and make it the current directory
mkdir -p ~/src/LTE_TOOLS && cd ~/src/LTE_TOOLS

#Download the Raspberry Pi specific LTE-Tools source code
wget http://rfhead.net/sats/LTE-Cell-Scanner_rpi.tar.gz ||
  { echo 'Unable to download the LTE-Tools source code file'; exit 1; }
  
# Extract the source code from the gzipped tarball
tar -xzf LTE-Cell-Scanner_rpi.tar.gz
 
#Change the directory containing the rtl-sdr source code to the current directory
cd ~/src/LTE_TOOLS/LTE-Cell-Scanner

#Make a directory for an indirect build of the LTE-Tools object code
mkdir build

#Make the indirect build directory the current directory
cd build

#Configure the Makefile for the LTE-Tools compile
cmake ../

#Compile and install the LTE-Tools executables
make -j3 && sudo make install ||
  { echo 'Unable to install the LTE-Tools executables'; exit 1; }
  
