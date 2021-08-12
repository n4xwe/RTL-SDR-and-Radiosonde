# RTL-SDR-and-Radiosonde

This folder contains BASH Scripts that install and configure RTL-SDR drivers, the auto_rx (Auto Receive) Radiosonde software package, tools that discover LTE cellular towers and CubicSDR with RTL-SDR support on the Raspberry Pi and Ubuntu MATE operating systems.

The scripts titled rpi-(name of the package) have been tested on an 8GB RPi 4 running the May 7, 2021, release of the Raspberry Pi OS 32-bit version. The scripts titled rpi-mate-(name of the package) have been tested on an 8GB RPi 4 running the 64-bit version of Ubuntu MATE 20.10. They may or may not work successfully on other models of the Raspberry Pi or other versions of the Raspberry Pi OS or Ubuntu MATE Operating Systems. 

In order for the script to function correctly you must have a reasonable connection to the Internet. The suggested method of launching the scripts is to create a separate directory named src off of the $HOME directory (/home/pi/src). Copy the script file to the src directory. Using the Command Line change the file permissions of the script to allow its execution (chmod +x name-of-the script.sh). The same result can be achieved on the Raspberry Pi OS Desktop by doing a right click on your script and choosing Properties from the pop-up menu, then open the Permissions tab. Opposite "Execute" change Nobody to Anyone. On the Ubuntu MATE Desktop do a right click on your script and choose Properties from the bottom of the pop-up menu, open the Permissions tab.  Put a check in the "Allow executing file as a program" checkbox.

To start the script from the Command Line preface the script name with a dot slash (./name-of-the-script.sh) and press the Enter key.  Hint: the file names in the src folder can be listed with the "ls" command. Highlight the filename with the cursor, copy and then paste the file name onto the command line.

The script will update all of the packages on your Operating System to their latest versions. It will also locate, download and compile all of the required dependencies and the requisite source code. In many instances there are statements in the scripts that place icons on the Desktop and provide essential configuration of the software. In the case of the RTL-SDR driver installation the OS must be rebooted in order to enable the udev rules which allow users other than root to use the RTL-SDR USB connection to the Raspberry Pi.

The scripts that compile and install CubicSDR with RTL-SDR support have a compile time of approximately 45 minutes. The dependencies that CubicSDR needs for its compile include the wxWidgets librairies which alone require a compile time of 35 minutes.

The scripts that compile and install the auto_rx (Auto Receive) Radiosonde software packag have a compile time of approximately 15 minutes. 

The connection between the RTL-SDR and Raspberry Pi can be tested by executing "rtl_test" on the command line.  Additional instructions on testing and setting up the Radiosonde auto_rx program are available at https://github.com/projecthorus/radiosonde_auto_rx/wiki

A very powerful spectrum scanning and analysis program is built into the RTL-SDR utilites.  More information about using the command line "rtl_power" command can be found at http://kmkeen.com/rtl-power/

LTE Tools is a collection of tools to locate and track LTE basestation cells using very low performance RF front ends. These tools work with RTL2832 based dongles. The 'CellSearch' program can be used to search for LTE carriers within a range of frequencies.  Once an LTE frequency has been located, 'LTE-Tracker' can be used to monitor and track, in realtime, any LTE cells on that frequency.

All of the scripts have detailed inline comments that explain the function of every line in the script. They are offered under GPL v3.0 and can be easily modified by any user. Approximate runtimes for the scripts are included in the script descriptions. The exact runtime depends on a number of factors including the state of the packages on your system and the speed of your Internet connection.


