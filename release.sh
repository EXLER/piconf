#!/usr/bin/env bash
# Exit on first error
set -e

# Parse CLI arguments
version="$1"
if test "$version" = ""; then
	echo "Usage: $0 <version>" 1>&2
	exit 1
fi

# Commit changes
git add .
git commit -m "Release: $version"

# Tag the release
git tag "$version"

# Publish the release
git push
git push --tags