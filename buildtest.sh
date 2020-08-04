#!/bin/bash

image=$1              
tag=$(cat version)

if [ -z $image ]; then
  echo "ABORTING: Image is a required argument"
  echo "example usage: ./buildtest.sh dtdemos/keptn-docker-tasks"
  exit 1
fi

echo "==============================================="
echo "build $image:$tag"
echo "==============================================="
docker build -t $image:$tag .

echo "==============================================="
echo "test"
echo "==============================================="
./test.sh $image:$tag
