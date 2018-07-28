#!/usr/bin/env bash
# Exit on first error
set -e

# Check if user has superuser priviliges
if [ "$EUID" -ne 0 ]; then
	echo "[!] Please run the Winogrono setup as root!"
	exit 1
fi

# Updating system and downloading necessary packages
echo -e "[+] Updating system and downloading packages..\n"
sudo apt update
sudo apt full-upgrade
sudo apt install -y apache2 php php-sqlite3

# Cleaning up
echo -e "[+] Cleaning up after install.."
sudo apt autoremove