#!/bin/sh
#install CubicSDR (0.2.6a) SoapySDR () 
#N4XWE 8-01-2021
#Visit http://www.


#Update the apt cache and upgrade the system packages to their latest versions
sudo apt update && sudo apt upgrade -y

#Download and install the dependencies
sudo apt -y install git build-essential automake cmake libpulse-dev libgtk-3-dev freeglut3 freeglut3-dev \
librtlsdr-dev libfftw3-3 libfftw3-dev libatomic-ops-dev ||
	{ echo 'Dependency installation failed'; exit 1; }

#Install the udev rules that enable the rtl-sdr to be used as a USB device for a non-root owner
sudo wget -O /etc/udev/rules.d/20-rtlsdr.rules https://raw.githubusercontent.com/osmocom/rtl-sdr/master/rtl-sdr.rules

#Create a unique directory for the CubicSDR compile and make it the current directory
mkdir -p ~/src/CUBICSDR && cd ~/src/CUBICSDR


git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr/
mkdir build
cd build
cmake ../
make
sudo make install
sudo ldconfig








#Change to the unique directory created for the CubicSDR compile
cd ~/src/CUBICSDR

#Clone the most recent version of the SoapySDR source code from github
git clone https://github.com/pothosware/SoapySDR.git ||
  { echo 'Unable to download the SoapySDR source code file'; exit 1; }

#Change the directory containing the SoapySDR source code to the current directory
cd ~/src/CUBICSDR/SoapySDR

#Make a directory for an indirect build of the SoapySDR object code
mkdir build

#Make the indirect build directory the current directory
cd build

#Configure the Makefile for the SoapySDR compile
cmake ../ -DCMAKE_BUILD_TYPE=Release

#Compile and install SoapySDR modules
make -j3 && sudo make install

#Link the SoapySDR library files
sudo ldconfig  

#Change to the unique directory created for the CubicSDR compile
cd ~/src/CUBICSDR

#Clone the most recent version of the SoapyRTLSDR source code from github
git clone https://github.com/pothosware/SoapyRTLSDR.git ||
  { echo 'Unable to download the SoapyRTLSDR source code file'; exit 1; }
 
#Change the directory containing the SoapyRTLSDR source code to the current directory
cd ~/src/CUBICSDR/SoapyRTLSDR

#Make a directory for an indirect build of the SoapyRTLSDR object code
mkdir build

#Make the indirect build directory the current directory
cd build

#Configure the Makefile for the SoapyRTLSDR compile
cmake ../ 

#Compile and install SoapyRTLSDR modules
make -j3 && sudo make install ||
  { echo 'Unable to download the SoapyRTLSDR modules'; exit 1; }
  
#Link the SoapyRTLSDR library files
sudo ldconfig  

#Change to the unique directory created for the CubicSDR compile
cd ~/src/CUBICSDR

#Clone the most recent version of the liquid-dsp source code from github
git clone https://github.com/jgaeddert/liquid-dsp ||
  { echo 'Unable to download the liquid-dsp source code file'; exit 1; }
 
#Change the directory containing the liquid-dsp source code to the current directory
cd ~/src/CUBICSDR/liquid-dsp

#Run the bootstrap script
./bootstrap.sh

#Set the Compile flags
CFLAGS="-march=native -O3"

#Configure the Makefile for the liquid-dsp compile
./configure

#Compile and install liquid-dsp
make -j3 && sudo make install ||
  { echo 'Unable to install liquid-dsp'; exit 1; }
  
#Link the liquid-dsp library files
sudo ldconfig  

#Change to the unique directory created for the CubicSDR compile
cd ~/src/CUBICSDR

#Download the version 3.1.5 of the WxWidgetss source code from github
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.5/wxWidgets-3.1.5.tar.bz2

#Extract the wxWidgets source code
tar -xvjf wxWidgets-3.1.5.tar.bz2  

#Change the directory containing the wxWigets source code to the current directory
cd wxWidgets-3.1.5

#Create a directory for the wxWidgets static library
mkdir -p ~/Develop/wxWidgets-staticlib

#Run the wxWidgets autogeneration script
./autogen.sh 

#Configure the Makefile for the wxWidgets library compile
./configure --prefix=`echo ~/Develop/wxWidgets-staticlib` --with-opengl --disable-shared --enable-monolithic --with-libjpeg --with-libtiff --with-libpng --with-zlib --disable-sdltest --enable-unicode --enable-display --enable-propgrid --disable-webview --disable-webviewwebkit CXXFLAGS="-std=c++0x"

#Compile and install wxWidgets static library
make -j3 && make install ||
  { echo 'Unable to install the wxWidgets library'; exit 1; }

#Change to the unique directory created for the CubicSDR compile
cd ~/src/CUBICSDR

#Clone the most recent version of the CubicSDR source code from github
git clone https://github.com/cjcliffe/CubicSDR.git

#Make the directory containing the CubicSDR source code the current directory
cd CubicSDR

#Make a directory for an indirect build of the CubicSDR object code
mkdir build

#Make the indirect build directory the current directory
cd build

#Configure the Makefile for the CubicSDR compile
cmake ../ -DCMAKE_BUILD_TYPE=Release -DwxWidgets_CONFIG_EXECUTABLE=~/Develop/wxWidgets-staticlib/bin/wx-config -DOTHER_LIBS="-latomic"

#Compile and install CubicSDR executable
make -j3 && sudo make install  ||
  { echo 'Unable to install CubicSDR'; exit 1; }















