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

# Update system and installing packages
echo -e "[+] Updating system and installing packages..\n"
apt update
apt full-upgrade
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt install -y nodejs
npm install -g pm2

# Start web interface
echo -e "[+] Starting web interface.. Default port: 4803\n"
pm2 start web/bin/www --name winogrono-web
pm2 startup

# Add folder with CLI scripts to PATH
echo -e "[+] Copying files to /usr/bin..\n"
cp ./cli/winogrono.sh /usr/bin

# Clean up
echo -e "[+] Cleaning up after install..\n"
apt autoremove

# Reboot
reboot
