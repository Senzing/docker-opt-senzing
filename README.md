# docker-opt-senzing

## Overview

The `senzing/opt-senzing` docker image contains a "baked-in" `/opt/senzing` directory.

The image is meant to be used as the value of a Dockerfile `FROM` statement. Examples:

```Dockerfile
FROM senzing/opt-senzing
```

```Dockerfile
ARG BASE_IMAGE=debian:9
FROM ${BASE_IMAGE}
```

Example docker build:

```console
export BASE_IMAGE=senzing/opt-senzing

sudo docker build \
  --tag senzing/senzing-base \
  --build-arg BASE_IMAGE=${BASE_IMAGE} \
  https://github.com/senzing/senzing-base.git
```

### Contents

1. [Expectations](#expectations)
    1. [Space](#space)
    1. [Time](#time)
    1. [Background knowledge](#background-knowledge)
1. [Demonstrate](#demonstrate)
    1. [Build docker image](#build-docker-image)
    1. [Configuration](#configuration)
    1. [Run docker container](#run-docker-container)
1. [Develop](#develop)
    1. [Prerequisite software](#prerequisite-software)
    1. [Clone repository](#clone-repository)
    1. [Downloads](#downloads)
    1. [Build docker image for development](#build-docker-image-for-development)

## Expectations

### Space

This repository and demonstration require 6 GB free disk space.

### Time

Budget 30 minutes to get the demonstration up-and-running, depending on CPU and network speeds.

### Background knowledge

This repository assumes a working knowledge of:

1. [Docker](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/docker.md)

## Demonstrate

### Build docker image

See [Develop](#develop).

### Configuration

No configuration.

### Run docker container

1. Run the docker container.  Example:

    ```console
    sudo docker run \
      --interactive \
      --rm \
      --tty \
      senzing/opt-senzing
    ```

## Develop

### Prerequisite software

The following software programs need to be installed.

#### git

1. [Install Git](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-git.md)
1. Test

    ```console
    git --version
    ```

#### make

1. [Install make](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-make.md)
1. Test

    ```console
    make --version
    ```

#### docker

1. [Install docker](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-docker.md)
1. Test

    ```console
    sudo docker --version
    sudo docker run hello-world
    ```

### Clone repository

1. Set these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=docker-opt-senzing
    ```

   Then follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/clone-repository.md).

1. After the repository has been cloned, be sure the following are set:

    ```console
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

### Downloads

#### Download Senzing_API.tgz

1. See [Downloading Senzing_API.tgz](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/create-senzing-dir.md#downloading-senzing_apitgz) for instructions on downloading file.
1. Download `Senzing_API.tgz` to ${GIT_REPOSITORY_DIR}/[downloads](./downloads) directory.

### Build docker image for development

1. Variation #1 - Using `make` command.

    ```console
    cd ${GIT_REPOSITORY_DIR}
    sudo make docker-build
    ```

    Note: `sudo make docker-build-base` can be used to create cached docker layers.

1. Variation #2 - Using `docker` command.

    ```console
    export DOCKER_IMAGE_NAME=senzing/opt-senzing

    cd ${GIT_REPOSITORY_DIR}
    sudo docker build --tag ${DOCKER_IMAGE_NAME} .
    ```
