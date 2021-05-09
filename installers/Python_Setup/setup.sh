#!/bin/bash

#is_root () { [ ${EUID:-$(id -u)} -eq 0 ]; }


# Define a function for returning a timestamp
#timestamp() {
#    date + "%T"  # The current time.
#}


#out() {

#}


#echo "[DefiniCLI:Setup - $(timestamp)]

#if ((is_root)); then
#    echo "This script should not be run as root!"
#    echo "For your security we'll directly call for sysadmin access via the 'sudo' command when deemed necessary. Then the 'sudo' process will ask you to provide your password. That password is not provided to the script, and will go straight to the component desired.x"
#    echo "Please try running this script again without being root."
#    exit 1
#else

sudo apt install -y python3-dev python-smbus i2c-tools python3-pil python3-pip python3-setuptools  python3-rpi.gpio
