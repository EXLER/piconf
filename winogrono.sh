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

# Update system and installing packages
echo -e "[+] Updating system and installing packages..\n"
apt update
apt full-upgrade -y
apt install -y ufw

# Enable SSH
echo -e "[+] Enabling SSH..\n"
raspi-config nonint do_ssh 0

# Enable firewall
echo -e "[+] Enabling firewall..\n"
ufw enable
ufw allow 22 80 443
ufw limit ssh/tcp

# Update MOTD
echo -e "[+] Updating MOTD..\n"
rm -rf /etc/update-motd.d/*
cp ./scripts/10-info /etc/update-motd.d

# Clean up
echo -e "[+] Cleaning up after install..\n"
apt autoremove

# Set new hostname
truncate -s 0 /etc/hostname
echo $NEW_HOSTNAME > /etc/hostname
sed -i "$ d" /etc/hosts
echo "127.0.1.1		${NEW_HOSTNAME}" > /etc/hosts

# Reboot
reboot
