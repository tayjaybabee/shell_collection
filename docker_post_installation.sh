#!/bin/bash

# Created: 12/08/2020 - 11:07PM
# Purpose: Prepare environment after installation of docker.

# Check if sudo, if so tell the user to run regularly and we'll take care of sudo calls
if [ "$EUID" == 0  ]
    then
        echo "Please do not run this file as root!"
        echo "Try running again, but this time don't use 'sudo'"
        exit 1
fi

echo "This wizard may use the 'sudo' prefix which (when used) may ask for your password."
read -p "Continue? [N/y/?] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
    then
        printf "Very well, preparing install..."
else
    if [[ $REPLY =~ ^[?]$ ]]
        then
            printf "The following commands would be run using the 'sudo' prefix:"
            printf "\ngroupadd\n
            usermod\n
            chown\n
            chmod\n
            systemctl\n
            chkconfig"
    fi
fi

echo "Preparing environment to allow ease-of-use..."
