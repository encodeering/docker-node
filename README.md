## Automatically created docker image for node

[![Build Status](https://travis-ci.org/encodeering/docker-node.svg?branch=master)](https://travis-ci.org/encodeering/docker-node)

### Docker

```docker pull encodeering/node-armhf```

- 4.2.4, 5.4.1
- https://hub.docker.com/r/encodeering/node-armhf/

```docker pull encodeering/node-amd64```

- 4.2.4, 5.4.1
- https://hub.docker.com/r/encodeering/node-amd64/

### Modification

Architecture is hard-coded and has been made configurable

- 4.2.4 includes a NODE_ARCH argument. Please look at the [patch](.patch/4.2/Dockerfile.patch) for further information.
- 5.4.1 includes a NODE_ARCH argument. Please look at the [patch](.patch/5.4/Dockerfile.patch) for further information.
