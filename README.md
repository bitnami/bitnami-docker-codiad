[![CircleCI](https://circleci.com/gh/bitnami/bitnami-docker-codiad/tree/master.svg?style=shield)](https://circleci.com/gh/bitnami/bitnami-docker-codiad/tree/master)
[![Docker Hub Automated Build](http://container.checkforupdates.com/badges/bitnami/codiad)](https://hub.docker.com/r/bitnami/codiad/)

# What is Codiad?

> Codiad is a web-based IDE framework with a small footprint and minimal requirements.

http://codiad.com/

# TL;DR;

```bash
$ curl -LO https://raw.githubusercontent.com/bitnami/bitnami-docker-codiad/master/docker-compose.yml
$ docker-compose up
```

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
      - 'codiad_data:/bitnami/codiad'
      - 'apache_data:/bitnami/apache'
      - 'php_data:/bitnami/php'
volumes:
  codiad_data:
    driver: local
  apache_data:
    driver: local
  php_data:
    driver:local
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

For persistence of the Codiad deployment, the above examples define docker volumes namely `codiad_data` and `apache_data`. The Codiad application state will persist as long as these volumes are not removed.

If avoid inadvertent removal of these volumes you can [mount host directories as data volumes](https://docs.docker.com/engine/userguide/containers/dockervolumes/#mount-a-host-directory-as-a-data-volume). Alternatively you can make use of volume plugins to host the volume data.

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
      - '/path/to/codiad-persistence:/bitnami/codiad'
      - '/path/to/apache-persistence:/bitnami/apache'
      - '/path/to/php-persistence:/bitnami/php'
```

### Mount host directories as data volumes using the Docker command line

1. Create the Codiad the container with host volumes

  ```bash
  $ docker run -d -p 80:80 -p 443:443 --name codiad \
    --volume /path/to/codiad-persistence:/bitnami/codiad \
    --volume /path/to/apache-persistence:/bitnami/apache \
    --volume /path/to/php-persistence:/bitnami/php \
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
      - '/path/to/codiad_persistence:/bitnami/codiad'
      - '/path/to/apache-persistence:/bitnami/apache'
      - '/path/to/php-persistence:/bitnami/php'
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
    --volume /path/to/codiad-persistence:/bitnami/codiad \
    --volume /path/to/apache-persistence:/bitnami/apache \
    --volume /path/to/php-persistence:/bitnami/php \
    --volume /path/to/themes-persistence:/opt/bitnami/codiad/themes \
    --volume /path/to/plugins-persistence:/opt/bitnami/codiad/plugins \
    bitnami/codiad:latest
  ```

# Upgrading Codiad

Bitnami provides up-to-date versions of Codiad, including security patches, soon after they are made upstream. We recommend that you follow these steps to upgrade your container. We will cover here the upgrade of the Codiad container.

The `bitnami/codiad:latest` tag always points to the most recent release. To get the most recent release you can simple repull the `latest` tag from the Docker Hub with `docker pull bitnami/codiad:latest`. However it is recommended to use [tagged versions](https://hub.docker.com/r/bitnami/codiad/tags/).

Get the updated image:

```
$ docker pull bitnami/codiad:latest
```

## Using Docker Compose

1. Stop the running Codiad container
  ```bash
  $ docker-compose stop codiad
  ```

2. Remove the stopped container
  ```bash
  $ docker-compose rm codiad
  ```

3. Launch the updated Codiad image
  ```bash
  $ docker-compose start codiad
  ```

## Using Docker command line

1. Stop the running Codiad container
  ```bash
  $ docker stop codiad
  ```

2. Remove the stopped container
  ```bash
  $ docker rm codiad
  ```

3. Launch the updated Codiad image
  ```bash
  $ docker run -d --name codiad -p 80:80 -p 443:443 \
    --volume codiad_data:/bitnami/codiad \
    --volume apache_data:/bitnami/apache \
    --volume php_data:/bitnami/php \
    bitnami/codiad:latest
  ```

> **NOTE**:
>
> The above command assumes that local docker volumes are in use. Edit the command according to your usage.

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
      - codiad_data:/bitnami/codiad
      - apache_data:/bitnami/apache
      - php_data:/bitnami/php
volumes:
  codiad_data:
    driver: local
  apache_data:
    driver: local
  php_data:
    driver: local
```

### Specifying Environment variables on the Docker command line

```bash
$ docker run -d --name codiad -p 80:80 -p 443:443 \
  --env CODIAD_PASSWORD=my_password \
  --volume codiad_data:/bitnami/codiad \
  --volume apache_data:/bitnami/apache \
  --volume php_data:/bitnami/php \
  bitnami/codiad:latest
```

# Backing up your application

To backup your application data follow these steps:

## Backing up using Docker Compose

1. Stop the Codiad container:
  ```bash
  $ docker-compose stop codiad
  ```

2. Copy the Codiad, php and Apache data
  ```bash
  $ docker cp $(docker-compose ps -q codiad):/bitnami/codiad/ /path/to/backups/codiad/latest/
  $ docker cp $(docker-compose ps -q codiad):/bitnami/apache/ /path/to/backups/apache/latest/
  $ docker cp $(docker-compose ps -q codiad):/bitnami/php/ /path/to/backups/phpOC/latest/
  ```

3. Start the Codiad container
  ```bash
  $ docker-compose start codiad
  ```

## Backing up using the Docker command line

1. Stop the Codiad container:
  ```bash
  $ docker stop codiad
  ```

2. Copy the Codiad, php and Apache data
  ```bash
  $ docker cp codiad:/bitnami/codiad/ /path/to/backups/codiad/latest/
  $ docker cp codiad:/bitnami/apache/ /path/to/backups/apache/latest/
  $ docker cp codiad:/bitnami/php/ /path/to/backups/php/latest/
  ```

3. Start the Codiad container
  ```bash
  $ docker start codiad
  ```

# Restoring a backup

To restore your application using backed up data simply mount the folder with Codiad and Apache data in the container. See [persisting your application](#persisting-your-application) section for more info.

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

Copyright (c) 2017 Bitnami

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
