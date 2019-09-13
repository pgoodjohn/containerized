#!/usr/bin/env sh

set -e

# Repository to push images to
REPOSITORY=pgoodjohn

# Name for the images
NAME=nginx

# For every dockerfile we create and push the image
# VERSION=$(echo $1 | sed -e "s/Dockerfile-//g")

echo "Building $1 to $REPOSITORY/$NAME:$VERSION"
