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

DEFAULT_TMP="/home/$USER/.tmp/Inspyre-Softworks/installers"

# Create a function that allows us to see if a command resolves.
test_cmd () {
    command -v "$1" >/dev/null
}

b_title="~~Zenmap Installer (by Inspyre Softworks)~~"

# Create a function to call a greeting box.
greet_box () {
    return dialog --backtitle $b_title\
    --title "Welcome!" --msgbox "Welcome to Zenmap Installer by Inspyre Softworks!"\
    14 40
}

# Greet the user
greet_box
echo "Checking environment..."
echo "Checking dependencies..."

# Check if sudo, if so tell the user to run regularly and we'll take care of sudo calls
if [ "$EUID" == 0  ]
    then
        echo "Please do not run this file as root!"
        echo "Try running again, but this time don't use 'sudo'"
        exit 1
fi

# Create a function that returns help if the user requests it  in the SUDO use confirmation screen
sudo_use_help () {

    printf "\nThe following commands would be run using the 'sudo' prefix:"
    printf "\ngroupadd\nusermod\nchown\nchmod\nsystemctl\nchkconfig\n"
    confirm_sudo_use

}

# Produce a check asking the user if they're sure they want to run this script as it may ask for sudo access.
confirm_sudo_use () {

    dialog --title "Super-User Access Needed" \
    --backtitle "$b_title" \
    --yesno "This wizard may use the 'sudo' prefix which (when used) may ask for your password." 15 25

    exit_statement="User has pressed the \"Escape\" (ESC) key on the keyboard.\nExiting program..."
    agree_statement="Good sheeple"
    refuse_satement="No Super User for you"


    response=$?

    case $response in
        0) printf "$agree_statement\n";;
        1) printf "$refuse_statement\n";;
        255) printf "$exit_statement\n";;
    esac

    # echo "This wizard may use the 'sudo' prefix which (when used) may ask for your password."
    # read -p "Continue? [N/y/?] " -n 1 -r
    # if [[ $REPLY =~ ^[Yy]$ ]]
    #     then
    #         printf "Very well, starting wizard..."
    #         main
    # else
    #     if [[ $REPLY =~ ^[?]$ ]]
    #         then
    #             sudo_use_help
    #     fi
    # fi
    
    # printf "\n\nI can't move forward without this permission. If you'd like you can open the script and take a look at the process to do it yourself.\n\n"
    # exit 1
}

# The main function of the script. This will handle the highest level of operations for this script.
main () {

    echo "Installing 'alien' which can convert RPM packages to DEB packages."
    sudo apt update && sudo apt install alien

    confirm_dir_creation
    if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo "Cool, I'll do that"
    else
        if [[ $REPLY =~ ^[Nn]$ ]]
            then
                echo ".."
        fi

    fi
                
    #wget https://nmap.org/dist/zenmap-7.91-1.noarch.rpm`````````````````````````````````````````````

    
}

# Assign a default directory to download our packages
TMP_DIR=$DEFAULT_TMP    

# Confirm with the user that we can create directory at the given path
confirm_dir_creation () {
    echo "Can we create a directory at $TMP_DIR"
    ask=(dialog --backtitle "$b_title" --yesno "Would you like to use $DEFAULT_TEMP" 14 48)
    echo "$ask"
}

# Advise the user that in order to proceed we'll need them to enter their sudo password when
# needed
confirm_sudo_use
