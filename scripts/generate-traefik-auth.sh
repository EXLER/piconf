#!/usr/bin/env bash

command -v docker >/dev/null 2>&1 || { echo >&2 "Docker is required for this script. Aborting."; exit 1; }

# Pull httpd:alpine image (small and includes httpasswd)
docker pull httpd:alpine >/dev/null 2>&1

echo "Basic auth for traefik >= v1.7"
read -p "User: "  USER
read -p "Password: "  PW

# Generate strings
echo "------- TOML --------"
string=$(docker run --rm -i -t httpd:alpine htpasswd -nbB $USER $PW)
echo "$string"
echo "------- docker-compose.yml --------"
echo "$string" | sed -e 's/\$/\$\$/g'
