#!/usr/bin/env bash

command -v htpasswd >/dev/null 2>&1 || { echo >&2 "htpasswd (pkg: apache2-utils) is required for this script. Aborting."; exit 1; }

echo "Basic auth for traefik >= v1.7"
read -p "User: "  USER
read -p "Password: "  PW

# Generate strings
echo "------- TOML --------"
string=$(htpasswd -nbB $USER $PW)
echo "$string"
echo "------- docker-compose.yml --------"
echo "$string" | sed -e 's/\$/\$\$/g'
