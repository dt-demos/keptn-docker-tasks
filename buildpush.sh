#!/bin/bash

image=$1              
tag=$(cat version)

if [ -z $image ]; then
  echo "ABORTING: Image is a required argument"
  echo "example usage: ./buildpush.sh dtdemos/keptn-docker-tasks:0.1.0"
  exit 1
fi

echo "==============================================="
echo "build and push $image:$tag"
echo "==============================================="
docker build -t $image:$tag .
docker push $image:$tag

