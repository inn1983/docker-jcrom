docker-jcrom
==================

Create a [Docker] based environment to build [B2JC].

This Dockerfile will create a docker container which is based on Ubuntu 12.04.
It will install the "repo" utility and any other build dependencies which are required to compile B2JC.

The main working directory is a shared folder on the host system, so the Docker container will can be removed at any time.

**NOTE:** Remember that B2JC is a huge project. It will consume a large amount of disk space (~100 GB) and it can easily take hours to build.

### How to build

**NOTES:**
* You will need to [install Docker][Docker_Installation] to proceed!
* When running ```docker build```, the whole folder incl. the "firefoxos" working directory is transferred to the Docker daemon. The only way to work around this currently is to move the "firefoxos" folder away, then rebuild, and move it back into place again.
For more information, see [dotcloud/docker#2224].

```
git clone https://github.com/sola-dolphin1/docker-jcrom.git
cd docker-jcrom
git checkout -b b2jc-ubuntu-12.04 origin/b2jc-ubuntu-12.04
./build.sh
```

### How to run

```
cd docker-jcrom
./run.sh
```

### How to build B2JC for your device

* [B2JC Building][B2JC_Building]

==================

[Docker]:                      https://www.docker.io/
[B2JC]:                        https://sites.google.com/site/jcromfirefox/
[Docker_Installation]:         https://www.docker.io/gettingstarted/
[B2JC_Building]:               https://sites.google.com/site/jcromfirefox/home/firefox_build
[dotcloud/docker#2224]:        https://github.com/dotcloud/docker/issues/2224

