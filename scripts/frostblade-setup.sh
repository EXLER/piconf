#!/usr/bin/env bash

# set -e: Exit on command non-zero status
# set -u: Exit on reference to not defined variable
# set -o pipefail: Use the pipeline command return code for whole pipeline
# IFS: Internal Field Separator - controls word splitting
set -euo pipefail
IFS=$'\n\t'

# Check if user has superuser priviliges
if [[ "$EUID" -ne 0 ]]; then
    printf "[!] You need superuser privileges to run this script!\n"
    exit 1
fi

# Install common software
apt update
apt install git curl

# Set new hostname
printf "[!] Setting new hostname\n0"
truncate -s 0 /etc/hostname
printf "frostblade" > /etc/hostname
sed -i "$ d" /etc/hosts
printf "127.0.1.1       frostblade" > /etc/hosts

# Update MOTD
printf "[!] Updating MOTD\n"
rm -rf /etc/motd /etc/update-motd.d/*
wget https://raw.githubusercontent.com/EXLER/piconf/master/resources/frostblade-motd
chmod +x ./frostblade-motd
mv ./frostblade-motd /etc/update-motd.d/10-info

# Finito!
printf "[!] Done! Reboot your Raspberry Pi to see changes take effect.\n"
