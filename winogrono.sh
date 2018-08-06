#!/usr/bin/env bash
# Exit on first error
set -e

# Check if user has superuser priviliges
if [ "$EUID" -ne 0 ]; then
	echo "[!] Please run the Winogrono setup as root!"
	exit 1
fi

# Set new password
read -s -p "[?] New password: " NEW_PASSWORD
echo -e "\n"
echo "pi:${NEW_PASSWORD}" | sudo chpasswd

# Ask for new hostname
read -p "[?] New hostname: " NEW_HOSTNAME
echo -e "\n"

# Ask for coutnry code
read -p "[?] Country code (e.g.: gb): " COUNTRY_CODE

# Update system and installing packages
echo -e "[+] Updating system..\n"
apt update
apt full-upgrade -y

# Update Wi-Fi country code
echo -e "[+] Updating Wi-Fi country code..\n"
raspi-config nonint do_wifi_country $COUNTRY_CODE

# Enable SSH
echo -e "[+] Enabling SSH..\n"
raspi-config nonint do_ssh 0

# Update MOTD
echo -e "[+] Updating MOTD..\n"
rm -f /etc/motd
rm -rf /etc/update-motd.d/*
cp ./modules/10-info /etc/update-motd.d
chmod +x /etc/update-motd.d/10-info

# Set new hostname
truncate -s 0 /etc/hostname
echo $NEW_HOSTNAME > /etc/hostname
sed -i "$ d" /etc/hosts
echo "127.0.1.1		${NEW_HOSTNAME}" > /etc/hosts

# Reboot
reboot
