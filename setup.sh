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
echo "pi:${NEW_PASSWORD}" | sudo chpasswd

# Updating system and installing packages
echo -e "[+] Updating system and installing packages..\n"
sudo apt update
sudo apt full-upgrade
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g pm2

# Starting web interface
echo -e "[+] Starting web interace.. Default port: 4803\n"
pm2 start web/bin/www --name winogrono-web
pm2 startup

# Cleaning up
echo -e "[+] Cleaning up after install..\n"
sudo apt autoremove

# Reboot
sudo reboot
