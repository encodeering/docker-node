#!/usr/bin/env bash
# configuration
#   env.ARCH
#   env.PROJECT
#   env.VERSION
#   env.REPOSITORY

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

docker-pull "$REPOSITORY/buildpack-$ARCH:stretch" "buildpack-deps:stretch"

docker build -t "${DOCKER_IMAGE}" "$PROJECT/${VERSION%.*}/stretch"
