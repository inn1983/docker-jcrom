#!/bin/sh

cd $(dirname $0)

SOURCE=$(pwd)/android
CONTAINER=ubuntu14.04
REPOSITORY=jcrom/ubuntu14.04

# Create a shared folder which will be used as working directory.
test -d $SOURCE || mkdir $SOURCE

# Try to start an existing/stopped container with the given name $CONTAINER. Otherwise, run a new one.
docker start -i $CONTAINER 2>/dev/null || docker run --privileged=true -v $SOURCE:/home/jcrom/android -i -t --name $CONTAINER $REPOSITORY /bin/bash

exit $?
