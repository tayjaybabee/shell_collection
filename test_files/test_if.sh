#!/bin/bash

set -x
set -e

echo "This installer may use the 'sudo' prefix which (when used) may ask for your password."
read -p "Continue? [N/y/?] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]  
    then
        printf "\nVery well, preparing install...\n"
else
    if [[ $REPLY =~ ^[?]$ ]]
        then
            printf "\nHere is some help\n"
    fi
fi

