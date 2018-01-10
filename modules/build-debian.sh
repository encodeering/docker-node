#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/buildpack-$ARCH:stretch" "buildpack-deps:stretch"

docker-build "$PROJECT/${VERSION%.*}/stretch"
