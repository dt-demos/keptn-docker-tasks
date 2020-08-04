#!/bin/bash

image=$1
tag=$(cat version)

if [ -z $image ]; then
  echo "ABORTING: Image is a required argument"
  echo "example usage: ./build.sh dtdemos/keptn-docker-tasks"
  exit 1
fi

echo "==============================================="
echo "build $image:$tag"
echo "==============================================="
docker build --force-rm -t $image:$tag .

