# docker-opt-senzing

## :warning: Obsolete

This repository has not been updated to use the RPM/DEB installation of Senzing.

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

`senzing/opt-senzing` can also be used to initialize a
[docker named volume](https://docs.docker.com/storage/volumes/).
**Note:**
This does not work on all [types of docker volumes](https://success.docker.com/article/different-types-of-volumes).
This works on "named volumes", but does not work on "host volumes" nor "anonymous volumes".

### Contents

1. [Expectations](#expectations)
    1. [Space](#space)
    1. [Time](#time)
    1. [Background knowledge](#background-knowledge)
1. [Demonstrate](#demonstrate)
    1. [Build docker image](#build-docker-image)
    1. [Configuration](#configuration)
    1. [Demonstration 1](#demonstration-1)
    1. [Demonstration 2](#demonstration-2)
1. [Develop](#develop)
    1. [Prerequisite software](#prerequisite-software)
    1. [Clone repository](#clone-repository)
    1. [Download Senzing_API.tgz](#download-senzing_apitgz)
    1. [Build docker image for development](#build-docker-image-for-development)
1. [Examples](#examples)
1. [Errors](#errors)
1. [References](#references)

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps you'll need to make some choices.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

## Expectations

### Space

This repository and demonstration require 6 GB free disk space.

### Time

Budget 40 minutes to get the demonstration up-and-running, depending on CPU and network speeds.

### Background knowledge

This repository assumes a working knowledge of:

1. [Docker](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/docker.md)

## Demonstrate

### Build docker image

See [Develop](#develop).

### Configuration

No configuration.

### Demonstration 1

Run the docker container with `/opt/senzing` inside the docker container.

1. Run the docker container.  Example:

    ```console
    sudo docker run \
      --interactive \
      --rm \
      --tty \
      senzing/opt-senzing
    ```

### Demonstration 2

Run the docker container with `/opt/senzing` externalized to a named volume.

1. :pencil2: Set environment variables.  Example

    ```console
    DOCKER_VOLUME_NAME=my-volume
    ```

1. Create volume.  Example:

    ```console
    docker volume create --name ${DOCKER_VOLUME_NAME}
    ```

1. Run the docker container.  Example:

    ```console
    sudo docker run \
      --rm \
      --volume ${DOCKER_VOLUME_NAME}:/opt/senzing \
      senzing/opt-senzing
    ```

## Develop

### Prerequisite software

The following software programs need to be installed:

1. [git](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-git.md)
1. [make](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-make.md)
1. [docker](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-docker.md)

### Clone repository

1. Set these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=docker-opt-senzing
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/clone-repository.md) to install the Git repository.

### Download Senzing_API.tgz

:warning: **OBSOLETE:**  This is an obsolete step.
The method of installation is now using RPM/DEB files.
For information on the new method of installation, see "[How to initialize Senzing with Docker](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/initialize-senzing-with-docker.md)".

1. Visit [Downloading Senzing_API.tgz](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/create-senzing-dir.md#downloading-senzing_apitgz)
1. Download `Senzing_API.tgz` to ${GIT_REPOSITORY_DIR}/[downloads](./downloads) directory.

### Build docker image for development

1. **Option #1:** Using `docker` command and local repository.

    ```console
    cd ${GIT_REPOSITORY_DIR}
    sudo docker build --tag senzing/opt-senzing .
    ```

1. **Option #2:** Using `make` command.

    ```console
    cd ${GIT_REPOSITORY_DIR}
    sudo make docker-build
    ```

    Note: `sudo make docker-build-development-cache` can be used to create cached docker layers.

## Examples

## Errors

1. See [docs/errors.md](docs/errors.md).

## References

1. [Populate a volume using a container](https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container)
