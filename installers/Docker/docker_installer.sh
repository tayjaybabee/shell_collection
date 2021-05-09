#!/usr/bin/env bash
sudo apt remove docker docker-engine docker.io containerd runc


purge_old () {

    rm -rf /var/lib/docker

}


if [ -d /var/lib/docker ]; then
    echo "Evidence of a previous Docker installation found." 
    choices=('Yes' 'Ignore' 'Quit')
    PS3='Would you like it purged?: '
    select ans in "${choices[@]}"; do
        case $ans in
            "Yes")
                echo '[*] Purging old Docker Install...'
                purge_old
                ;;
            "Ignore")
                echo  '[X] Ignoring old Docker install...'
                ;;
            "Quit")
                echo '[!] Exiting'
                exit

                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done
fi
