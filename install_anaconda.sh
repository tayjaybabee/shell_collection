#!/bin/sh

####~~~~####~~~~####~~~~####~~~~####~~~~####
####~~~~#### Anaconda Installer ####~~~~####
####~~~~# Created: 12/8/2020 7:34AM #~~~~####
####~~~~# Author: Taylor Blackstone #~~~~####


# Install prerequisites.
sudo apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# Specify where we want to download the installer to
DOWNLOAD_DIR="/home/$USER/.tmp/anaconda/installer"

# If the specified download directory doesn't exist, we make it, and it's parents
[ ! -d $DOWNLOAD_DIR ] && mkdir -p $DOWNLOAD_DIR

# Navigate to the download dir
cd $DOWNLOAD_DIR

# Use wget to download Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh

# Execute the installer's shell script.
bash $DOWNLOAD_DIR/Anaconda3-2020.11-Linux-x86_64.sh


