#!/bin/sh

cd $(dirname $0)

SOURCE=$(pwd)/firefoxos

# Create a shared folder which will be used as working directory.
test -d $SOURCE || mkdir $SOURCE

docker build --no-cache --rm -t jcrom/ubuntu12.04-fxos .

exit $?
