#!/bin/sh

####~~~~ Homebrew Installer ~~~~####
##       Created: 12/8/2020       ##
#     Author: Taylor Blackstone    #
######~<tayjaybabee@gmail.com>~#####
#||||||||||||||||||||||||||||||||||#
##!!   Tested on Ubuntu 20.04   !!##

# Declare some variables here 
NEED_DM=false

# Grab the key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0

# Add the GH CLI repo
sudo apt-add-repository https://cli.github.com/packages

# Refresh package manifest
sudo apt update

# Install GH CLi package
sudo apt install gh -y
