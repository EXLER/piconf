#!/usr/bin/env bash
# Exit on first error
set -e

# Check if user has superuser priviliges
if [ "$EUID" -ne 0 ]; then
	echo "[!] Please run the Winogrono setup as root!"
	exit 1
fi

# Ask for password to use MySQL with
read -s -p "[?] MySQL password: " MYSQL_PASS

# Updating system and downloading necessary packages
echo -e "[+] Updating system and downloading packages..\n"
sudo apt update
sudo apt full-upgrade
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_PASS"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_PASS"
sudo apt install -y nodejs mysql-server
sudo npm install -g nodemon

# Cleaning up
echo -e "[+] Cleaning up after install.."
sudo apt autoremove