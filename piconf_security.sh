#!/usr/bin/env bash

# set -e: Exit on command non-zero status
# set -u: Exit on reference to not defined variable
# set -o pipefail: Use the pipeline command return code for whole pipeline
# IFS: Internal Field Separator - controls word splitting
set -euo pipefail
IFS=$'\n\t'

# Check if user has superuser priviliges
if [[ "$EUID" -ne 0 ]]; then
	printf "[!] You need superuser privileges to run this script!"
	exit 1
fi

# Adds new user and removes default 'pi' user
read -p "[?] New username: " NEW_USERNAME
adduser ${NEW_USERNAME}
adduser ${NEW_USERNAME} sudo
deluser --remove-home pi

# Installs ufw and fail2ban
printf "[!] Installing 'ufw' and 'fail2ban'..."
apt install -y ufw fail2ban
ufw enable
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
