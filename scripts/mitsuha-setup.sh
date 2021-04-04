#!/usr/bin/env bash

# set -e: Exit on command non-zero status
# set -u: Exit on reference to not defined variable
# set -o pipefail: Use the pipeline command return code for whole pipeline
# IFS: Internal Field Separator - controls word splitting
set -euo pipefail
IFS=$'\n\t'

# Update packages
apt update
apt full-upgrade

# Install Docker
apt install -y apache2-utils \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install -y docker-ce docker-ce-cli containerd.io

# Add user to Docker group
usermod -aG docker debian

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Change default SSH port
echo "Port 47777" | sudo tee -a /etc/ssh/sshd_config > /dev/null

# Additional hosting related
docker network create web
mkdir /home/debian/www
touch /home/debian/www/acme.json
chmod 600 /home/debian/www/acme.json
curl -o .env https://github.com/exler/post-config/blob/master/resources/mitsuha/.env.example
chown -R debian:debian /home/debian/www

# Finish
reboot
