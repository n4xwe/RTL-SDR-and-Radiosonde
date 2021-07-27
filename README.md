# RTL-SDR-and-Radiosonde

BASH Scripts that install the RTL-SDR drivers and settings on the Raspberry Pi OS or install the RTL-SDR drivers and settings plus the auto_rx (Auto Receive) Radiosonde software package to the Raspberry Pi OS.

These BASH scripts install the RTL-SDR and Project Thorus auto_rx package on a Raspberry Pi using the Raspberry Pi (formerly Raspbian) Operating System. The scripts titled rpi-(name of the package) have been tested on an 8GB RPi 4 running the May 7, 2021, release of the Raspberry Pi OS 32-bit version. The scripts titled rpi-mate-(name of the package) have been tested on an 8GB RPi 4 running the 64-bit version of Ubuntu MATE 20.10. They may or may not work successfully on other models of the Raspberry Pi or other versions of the Raspberry Pi OS or Ubuntu MATE Operating Systems.

In order for the script to function correctly you must have a reasonable connection to the Internet. The suggested method of launching the scripts is to create a separate directory named src off of the $HOME directory (/home/pi/src). Copy the script file to the src directory. Using the Command Line change the file permissions of the script to allow its execution (chmod +x name-of-the script.sh). The same result can be achieved on the Desktop by doing a right click on your script and choosing Properties from the pop-up menu, then switch to the Permissions tab, opposite "Execute" change Nobody to Anyone. To start the script from the Command Line preface the script name with a dot slash (./name-of-the-script.sh) and press the Enter key.

The script will update all of the packages on your Operating System to their latest versions. It will also locate, download and compile all of the required dependencies and the requisite source code. In many instances there are statements in the scripts that place icons on the Desktop and provide essential configuration of the software. In the case of the RTL-SDR driver installation the OS must be rebooted in order to enable the udev rules which allow users other than root to use the RTL-SDR USB connection to the Raspberry Pi.

The connection between the RTL-SDR and Raspberry Pi can be tested by executing "rtl_test" on the command line.  Additional instructions on testing and setting up the Radiosonde auto_rx program are available at https://github.com/projecthorus/radiosonde_auto_rx/wiki

All of the scripts have detailed inline comments that explain the function of every line in the script. They are offered under GPL v3.0 and can be easily modified by any user. Approximate runtimes for the scripts are included in the script descriptions. The exact runtime depends on a number of factors including the state of the packages on your system and the speed of your Internet connection.

