#!/bin/bash

#############################

# File: uninstall_pyenv.sh
# Author: Taylor-Jayde Blackstone
# Created: 12/15/2020
# Description: Uninstalls Pyenv from a system it's installed on.

#############################

# Set up a couple constants
INSTALL_PATH=/home/$USER/.pyenv/
BKUP_PATH=/home/$USER/Inspyre-Softworks


read -p "Are you sure you want to uninstall pyenv and any unused dependencies from your system? [N/y]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Removing $INSTALL_PATH"
    rm -fr "$INSTALL_PATH"
    echo "Removed!"
    echo "Removing text added to your .bashrc file..."
    sed -i '\:# < PYENV PATH INFO >:,\:# < /PYENV PATH INFO >:d' ~/.bashrc 
    echo "Restarting your shell to apply changes to PATH"
    exec $SHELL
    echo "Done!"

fi