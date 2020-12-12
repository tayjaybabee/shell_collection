#!/bin/bash

#########################

# File: install_zenmap.sh
# Created: 12/09/2020 - 5:15PM
# Author: Taylor-Jayde Blackstone

# Description: Downloads the RPM package for zenmap
#              and installs it to the local disk after
#              using 'alien' to convert it to an Ubuntu
#              package.

#########################

# Greet the user
echo "Welcome to the Zenmap Installer."

# Check if sudo, if so tell the user to run regularly and we'll take care of sudo calls
if [ "$EUID" == 0  ]
    then
        echo "Please do not run this file as root!"
        echo "Try running again, but this time don't use 'sudo'"
        exit 1
fi

confirm () {
    if [ $1 -n false ]
        then
            
}

# Advise the user that in order to proceed we'll need them to enter their sudo password when
# needed
echo "This installer may use the 'sudo' prefix which (when used) may ask for your password."
read -p "Continue? [N/y/?] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
    then
        printf "Very well, preparing install..."
else
    if [[ $REPLY =~ ^[?]$ ]]
        then
            printf "\nHere is some help\n"
    fi
fi
