[![CircleCI](https://circleci.com/gh/bitnami/bitnami-docker-codiad/tree/master.svg?style=shield)](https://circleci.com/gh/bitnami/bitnami-docker-codiad/tree/master)

# What is Codiad?

> Codiad is a web-based IDE framework with a small footprint and minimal requirements.

http://codiad.com/

# TL;DR;

## Docker Compose

```bash
$ curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-codiad/master/docker-compose.yml > docker-compose.yml
$ docker-compose up -d
```

# Why use Bitnami Images?

* Bitnami closely tracks upstream source changes and promptly publishes new versions of this image using our automated systems.
* With Bitnami images the latest bug fixes and features are available as soon as possible.
* Bitnami containers, virtual machines and cloud images use the same components and configuration approach - making it easy to switch between formats based on your project needs.
* Bitnami images are built on CircleCI and automatically pushed to the Docker Hub.
* All our images are based on [minideb](https://github.com/bitnami/minideb) a minimalist Debian based container image which gives you a small base container image and the familiarity of a leading linux distribution.

# Supported tags and respective `Dockerfile` links

* [`2`, `2.8.4-r53`, `latest` (2/Dockerfile)](https://github.com/bitnami/bitnami-docker-codiad/blob/2.8.4-r53/2/Dockerfile)
* [`2-ol-7`, `2.8.4-ol-7-r12` (2/ol-7/Dockerfile)](https://github.com/bitnami/bitnami-docker-codiad/blob/2.8.4-ol-7-r12/2/ol-7/Dockerfile)

Subscribe to project updates by watching the [bitnami/codiad GitHub repo](https://github.com/bitnami/bitnami-docker-codiad).

# Prerequisites

To run this application you need [Docker Engine](https://www.docker.com/products/docker-engine) >= `1.10.0`. [Docker Compose](https://www.docker.com/products/docker-compose) is recommended with a version `1.6.0` or later.

# How to use this image

## Using Docker Compose

The recommended way to run Codiad is using Docker Compose using the following `docker-compose.yml` template:

```yaml
version: '2'

services:
  codiad:
    image: 'bitnami/codiad:latest'
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - 'codiad_data:/bitnami'
volumes:
  codiad_data:
    driver: local
```

Launch the containers using:

```bash
$ docker-compose up -d
```

### Using the Docker Command Line

If you want to run the application manually instead of using `docker-compose`, these are the basic steps you need to run:

1. Run the Codiad container:

  ```bash
  $ docker run -d -p 80:80 -p 443:443 --name codiad bitnami/codiad:latest
  ```

2. Access your application at http://your-ip/

*Note:* If you want to access your application from a public IP or hostname you need to configure the application domain. You can handle it adjusting the configuration of the instance by setting the environment variable "CODIAD_HOST" to your public IP or hostname.

## Persisting your application

If you remove the container all your data and configurations will be lost, and the next time you run the image the database will be reinitialized. To avoid this loss of data, you should mount a volume that will persist even after the container is removed.

For persistence you should mount a volume at the `/bitnami` path. The above examples define a docker volume namely `codiad_data`. The Codiad application state will persist as long as this volume is not removed.

To avoid inadvertent removal of this volume you can [mount host directories as data volumes](https://docs.docker.com/engine/tutorials/dockervolumes/). Alternatively you can make use of volume plugins to host the volume data.

### Mount host directories as data volumes with Docker Compose

The following `docker-compose.yml` template demonstrates the use of host directories as data volumes.

```yaml
version: '2'

services:
  codiad:
    image: 'bitnami/codiad:latest'
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - '/path/to/codiad-persistence:/bitnami'
```

### Mount host directories as data volumes using the Docker command line

1. Create the Codiad the container with host volumes

  ```bash
  $ docker run -d -p 80:80 -p 443:443 --name codiad \
    --volume /path/to/codiad-persistence:/bitnami \
    bitnami/codiad:latest
  ```

### Mount plugins and themes directories as data volumes with Docker Compose

The default configuration only persists Codiad workspaces, configuration and data. The following `docker-compose.yml` template demonstrate the use of custom plugins and themes along with the rest of persistent directories.

```yaml
version: '2'

services:
  codiad:
    image: 'bitnami/codiad:latest'
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - '/path/to/codiad_persistence:/bitnami'
      - '/path/to/themes-persistence:/opt/bitnami/codiad/themes'
      - '/path/to/plugins-persistence:/opt/bitnami/codiad/plugins'
```

Themes persistence require a few additional steps:

  1. Codiad expects a theme by default (see the `CODIAD_THEME`) environment variable in the [environment variables](#environment-variables)). You can download it from the Codiad [GitHub repository](https://github.com/Codiad/Codiad/tree/master/themes)
  2. Place the downloaded theme at '/path/to/your/local/themes'. You should now have a '/path/to/your/local/themes/default' folder.

### Mount plugins and themes directories as data volumes using the Docker Command Line

1. Create the Codiad container with host volumes

  ```bash
  $ docker run -d -p 80:80 -p 443:443 --name codiad \
    --volume /path/to/codiad-persistence:/bitnami \
    --volume /path/to/themes-persistence:/opt/bitnami/codiad/themes \
    --volume /path/to/plugins-persistence:/opt/bitnami/codiad/plugins \
    bitnami/codiad:latest
  ```

# Upgrading Codiad

Bitnami provides up-to-date versions of Codiad, including security patches, soon after they are made upstream. We recommend that you follow these steps to upgrade your container. We will cover here the upgrade of the Codiad container.

1. Get the updated images:

```bash
$ docker pull bitnami/codiad:latest
```

2. Stop your container

 * For docker-compose: `$ docker-compose stop codiad`
 * For manual execution: `$ docker stop codiad`

3. Take a snapshot of the application state

```bash
$ rsync -a /path/to/codiad-persistence /path/to/codiad-persistence.bkp.$(date +%Y%m%d-%H.%M.%S)
```

You can use this snapshot to restore the application state should the upgrade fail.

4. Remove the stopped container

 * For docker-compose: `$ docker-compose rm -v codiad`
 * For manual execution: `$ docker rm -v codiad`

5. Run the new image

 * For docker-compose: `$ docker-compose up codiad`
 * For manual execution ([mount](#mount-persistent-folders-manually) the directories if needed): `docker run --name codiad bitnami/codiad:latest`

# Configuration

## Environment variables

The Codiad instance can be customized by specifying environment variables on the first run. The following environment values are provided to custom Codiad:

 - `CODIAD_USERNAME`: Codiad application username. Default: **user**
 - `CODIAD_PASSWORD`: Codiad application password. Default: **bitnami**
 - `CODIAD_PROJECT_NAME`: Project name to create at first run. Default: **Sample Project**.
 - `CODIAD_PROJECT_PATH`: Path to store the project. No defaults. Default: **sampleProject**.
 - `CODIAD_THEME`: Theme name to configure at first run. Default: **default**
 - `CODIAD_HOST`: Public IP or hostname to configure Codiad with. Default: **127.0.0.1**

### Specifying Environment variables using Docker Compose

```yaml
version: '2'

services:
  codiad:
    image: bitnami/codiad:latest
    ports:
      - '80:80'
      - '443:443'
    environment:
      - CODIAD_PASSWORD=my_password
    volumes:
      - codiad_data:/bitnami
volumes:
  codiad_data:
    driver: local
```

### Specifying Environment variables on the Docker command line

```bash
$ docker run -d --name codiad -p 80:80 -p 443:443 \
  --env CODIAD_PASSWORD=my_password \
  --volume codiad_data:/bitnami \
  bitnami/codiad:latest
```

# Contributing

We'd love for you to contribute to this container. You can request new features by creating an [issue](https://github.com/bitnami/bitnami-docker-codiad/issues), or submit a [pull request](https://github.com/bitnami/bitnami-docker-codiad/pulls) with your contribution.

# Issues

If you encountered a problem running this container, you can file an [issue](https://github.com/bitnami/bitnami-docker-codiad/issues). For us to provide better support, be sure to include the following information in your issue:

- Host OS and version
- Docker version (`$ docker version`)
- Output of `$ docker info`
- Version of this container (`$ echo $BITNAMI_IMAGE_VERSION` inside the container)
- The command you used to run the container, and any relevant output you saw (masking any sensitive information)

# License

Copyright 2018 Bitnami

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
