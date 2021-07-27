#!/bin/sh
#install rtl-sdr(6.1)
#N4XWE 7-27-2021
#Visit http://www.


#Update the apt cache and upgrade the system packages to their latest versions
sudo apt update && sudo apt upgrade -y

#Download and install the dependencies
sudo apt -y install python3 python3-numpy python3-setuptools python3-crcmod \
python3-requests python3-dateutil python3-pip python3-flask sox git build-essential \
libtool cmake usbutils libusb-1.0-0-dev rng-tools libsamplerate0-dev libatlas3-base \
libgfortran5 ||
	{ echo 'Dependency installation failed'; exit 1; }

#Install the udev rules that enable the rtl-sdr to be used as a USB device
sudo wget -O /etc/udev/rules.d/20-rtlsdr.rules https://raw.githubusercontent.com/osmocom/rtl-sdr/master/rtl-sdr.rules

#Create a unique directory for the radiosonde_auto_rx compile and make it the current directory
mkdir -p ~/src/RTL-SDR && cd ~/src/RTL-SDR

#Clone the most recent version of the rtl-sdr source code from github
git clone https://github.com/osmocom/rtl-sdr.git ||
  { echo 'Unable to download the rtl-sdr source code file'; exit 1; }
 
#Change the directory containing the rtl-sdr source code to the current directory
cd ~/src/RTL-SDR/rtl-sdr

#Make a directory for an indirect build of the rtl-sdr object code
mkdir build

#Make the indirect build directory the current directory
cd build

#Configure the Makefile for the rtl-sdr compile
cmake -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON ../

#Compile and install the rtl-sdr utilities
make -j3 && sudo make install ||
  { echo 'Unable to install the rtl-sdr utilities'; exit 1; }
  
#Link the rtl-sdr utilities files
sudo ldconfig  






