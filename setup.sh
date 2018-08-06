#!/usr/bin/env bash
# Exit on first error
set -e

# Check if user has superuser priviliges
if [ "$EUID" -ne 0 ]; then
	echo "[!] Please run the Winogrono setup as root!"
	exit 1
fi

# Set new password
read -s -p "[?] New password: \n" NEW_PASSWORD
echo "pi:${NEW_PASSWORD}" | sudo chpasswd

# Set new hostname
read -s -p "[?] New hostname: \n" NEW_HOSTNAME
truncate -s 0 /etc/hostname
echo $NEW_HOSTNAME > /etc/hostname
sed -i "$ d" /etc/hosts
echo "127.0.1.1		${NEW_HOSTNAME}" > /etc/hosts

# Update system and installing packages
echo -e "[+] Updating system and installing packages..\n"
apt update -y
apt full-upgrade
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt install -y nodejs ufw
npm install -g npm@latest 
npm install -g pm2
mkdir ./web/node_modules
npm install --prefix ./web

# Enable SSH
echo -e "[+] Enabling SSH..\n"
raspi-config nonint do_ssh 0

# Enable firewall
echo -e "[+] Enabling firewall..\n"
ufw enable
ufw allow 22 80 443 4083
ufw limit ssh/tcp

# Start web interface
echo -e "[+] Starting web interface.. Default port: 4803\n"
pm2 start ./web/bin/www --watch --name winogrono-web
pm2 save
pm2 startup

# Add folder with CLI scripts to PATH
echo -e "[+] Copying files to /usr/bin..\n"
cp ./scripts/winogrono.sh /usr/bin/winogrono

# Update MOTD
echo -e "[+] Updating MOTD..\n"
rm -rf /etc/update-motd.d/*
cp ./scripts/10-info /etc/update-motd.d

# Clean up
echo -e "[+] Cleaning up after install..\n"
apt autoremove

# Reboot
reboot
