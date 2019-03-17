#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

./build-${BASE}.sh

docker-verify node --version 2>&1 | dup | contains "v${VERSION}"
