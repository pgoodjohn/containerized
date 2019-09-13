#!/usr/bin/env sh

set -e

# Repository to push images to
REPOSITORY=pgoodjohn

# Name for the images
NAME=golang

# For every dockerfile we create and push the image
# VERSION=$(echo $1 | sed -e "s/Dockerfile-//g")
VERSION="1.12-tzdata"

echo "Building $1 to $REPOSITORY/$NAME:$VERSION"
docker build -t $REPOSITORY/$NAME:$VERSION .

docker push $REPOSITORY/$NAME:$VERSION
