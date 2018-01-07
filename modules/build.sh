#!/usr/bin/env bash
# configuration
#   env.ARCH
#   env.PROJECT
#   env.VERSION
#   env.REPOSITORY

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

docker-pull "$REPOSITORY/buildpack-$ARCH:jessie" "buildpack-deps:jessie"

patch -p1 --no-backup-if-mismatch --directory="$PROJECT" < "patch/$VERSION/Dockerfile.patch"

docker build -t "${DOCKER_IMAGE}"                \
             --build-arg NODE_VERSION="$PIN" \
             --build-arg NODE_ARCH="$NODE_ARCH"  \
             "$PROJECT/$VERSION"

docker run --rm "${DOCKER_IMAGE}" node --version
