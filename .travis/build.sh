#!/bin/bash

set -ev

TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION"

SEMANTIC="${VERSION%.*}"

. ".travis/config/$ARCH.sh"

docker pull   "$REPOSITORY/buildpack-$ARCH:jessie"
docker tag -f "$REPOSITORY/buildpack-$ARCH:jessie" "buildpack-deps:jessie"

patch -p1 --no-backup-if-mismatch --directory="$PROJECT" < ".patch/$SEMANTIC/Dockerfile.patch"

docker build -t "$TAG:$TAGSPECIFIER"             \
             --build-arg NODE_VERSION="$VERSION" \
             --build-arg NODE_ARCH="$NODE_ARCH"  \
             "$PROJECT/$SEMANTIC"

docker run --rm "$TAG:$TAGSPECIFIER" node --version
