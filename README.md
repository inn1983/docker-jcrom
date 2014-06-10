docker-jcrom
==================

Create a [Docker] based environment to build [JCROM].

This Dockerfile will create a docker container which is based on Ubuntu 14.04.
It will install the "repo" utility and any other build dependencies which are required to compile JCROM.

The main working directory is a shared folder on the host system, so the Docker container will can be removed at any time.

**NOTE:** Remember that JCROM is a huge project. It will consume a large amount of disk space (~100 GB) and it can easily take hours to build.

### How to build

**NOTES:**
* You will need to [install Docker][Docker_Installation] to proceed!
* When running ```docker build```, the whole folder incl. the "android" working directory is transferred to the Docker daemon. The only way to work around this currently is to move the "android" folder away, then rebuild, and move it back into place again.
For more information, see [dotcloud/docker#2224].

```
git clone https://github.com/sola-dolphin1/docker-jcrom.git
cd docker-jcrom
./build.sh
```

### How to run

```
cd docker-jcrom
./run.sh
```

### How to build JCROM for your device

* [JCROM Building][JCROM_Building]

==================

[Docker]:                      https://www.docker.io/
[JCROM]:                       https://sites.google.com/site/jcromproject/
[Docker_Installation]:         https://www.docker.io/gettingstarted/
[JCROM_Building]:              https://sites.google.com/site/jcromproject/home/jcrom_build/kitkat-android4-4-3
[dotcloud/docker#2224]:        https://github.com/dotcloud/docker/issues/2224

