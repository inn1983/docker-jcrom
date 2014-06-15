#!/bin/sh

cd $(dirname $0)

SOURCE=$(pwd)/firefoxos
CONTAINER=ubuntu12.04-fxos
REPOSITORY=jcrom/ubuntu12.04-fxos

# Create a shared folder which will be used as working directory.
test -d $SOURCE || mkdir $SOURCE

# Try to start an existing/stopped container with the given name $CONTAINER. Otherwise, run a new one.
docker start -i $CONTAINER 2>/dev/null || docker run --privileged=true -v $SOURCE:/home/jcrom/firefoxos -i -t --name $CONTAINER $REPOSITORY /bin/bash

exit $?
