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

# Install packages
apt install -y apache2 mariadb-server php libapache2-mod-php php-common php-mbstring php-xmlrpc php-soap php-bcmath php-gd php-xml php-intl php-mysql php-cli php-mcrypt php-ldap php-zip php-curl

# Disable directory listing
sed -i "s/Options Indexes FollowSymLinks/Options FollowSymLinks/" /etc/apache2/apache2.conf

read -s -p "[?] New password for MySQL root: " MYSQL_PASSWORD

# Manual mysql_secure_installation
# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MYSQL_PASSWORD}') WHERE User = 'root'"
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"
mysql -e "DROP USER ''@'$(hostname)'"
# Ensure the root cannot login remotely
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
# Kill off the demo database
mysql -e "DROP DATABASE IF EXISTS test"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"

# Add rules to firewall
ufw allow 80/tcp
ufw allow 443/tcp
