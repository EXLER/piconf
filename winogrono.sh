#!/usr/bin/env bash
# Exit on first error
set -e

# Check if user has superuser priviliges
if [ "$EUID" -ne 0 ]; then
	echo "[!] You need superuser privileges to use Winogrono!"
	exit 1
fi

# Set new password
read -s -p "[?] New password: " NEW_PASSWORD
echo -e "\n"

# Set new hostname
read -p "[?] New hostname: " NEW_HOSTNAME
echo -e "\n"
truncate -s 0 /etc/hostname
echo $NEW_HOSTNAME > /etc/hostname
sed -i "$ d" /etc/hosts
echo "127.0.1.1		${NEW_HOSTNAME}" > /etc/hosts

# Update system and installing packages
echo -e "[+] Updating system..\n"
apt update
apt full-upgrade -y

# Update MOTD
echo -e "[+] Updating MOTD..\n"
rm -f /etc/motd
rm -rf /etc/update-motd.d/*
chmod +x ./winogrono-info
cp ./winogrono-info /etc/update-motd.d/10-info

# Finito!
reboot
