#!/bin/bash

#~~~~||\/||\/||\/||\/||\/||\/||~~~~#
#~~~~||/\||/\||/\||/\||/\||/\||~~~~#
#~~~~||\/||\/||\/||\/||\/||\/||~~~~#
####~~~~####~~~~####~~~~####~~~~####
####~    Install All GIMP      ~####
####~   Created 17/08/2020     ~####
####################################
# Description: Installs all GIMP   #
# plugins/suites/packages avail.   #
# in the default Ubuntu 20.04      #
# repositories.                    #
####~~~~####~~~~####~~~~####~~~~####
####  Taylor-Jayde Blackstone   ####
###   <tayjaybabee@gmail.com>    ###
####################################
#~~~~||\/||\/||\/||\/||\/||\/||~~~~#
#~~~~||/\||/\||/\||/\||/\||/\||~~~~#
#~~~~||\/||\/||\/||\/||\/||\/||~~~~#
#----------------------------------#

if [[ $EUID -ne 0 ]]; then
    echo "Please do not run this script as root!"
    exit 1

fi
        
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
    
}

sudo apt udate
sudo apt install -y gimp gimp-gmic gimp-data-extras gimp-lensfun gimp-gutenprint gimp-gap gimp-dds gimp-dcraw gimp-cbmplugs

