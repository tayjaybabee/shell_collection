#!/bin/bash


####~~~~####~~~~####~~~~####~~~~####
####~     Pyenv Installer      ~####
####~    Created 10/08/2020    ~####
####################################
# Description: Installs Pyenv to   #
# your system, and prepares your   #
# user profile for ease of use.    #
####~~~~####~~~~####~~~~####~~~~####
####  Taylor-Jayde Blackstone   ####
###   <tayjaybabee@gmail.com>    ###
####################################

read -p "Are you sure you want to install pyenv and it's dependencies on your system? [N/y]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

	# Install the dependencies that Pyenv requires
	sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    	# Specify where we want to download the installer to
    	DOWNLOAD_DIR="/home/$USER/tmp/.pyenv/"

	# If the specified download directory doesn't exist, we make it, and it's parents
	[ ! -d $DOWNLOAD_DIR ] && mkdir -p $DOWNLOAD_DIR

	# Define some environment variables to add to .bashrc
	# Add a couple line-feeds
	# Add a comment
	echo "# Add pyenv environment information"

	printf '\n# < PYENV PATH INFO >\n\n' >> ~/.bashrc

	# Add the changes
	printf 'export PYENV_ROOT="$HOME/.pyenv"\n' >> ~/.bashrc
	printf 'export PATH="$PYENV_ROOT/bin:$PATH"\n' >> ~/.bashrc

	# Add pyenv to the shell and enale shims and autocompletion
	echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

	printf "\n# < /PYENV PATH INFO >\n\n" >> ~/.bashrc

	# Now that the environment is prepared we'll install the program.
        curl https://pyenv.run | bash

	# Now reinitialize the shell so that changes can take effect.
        exec $SHELL

        pyenv -V

fi

