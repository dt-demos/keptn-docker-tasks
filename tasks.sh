#!/usr/bin/env bash

task=$1

case $task in

  qualitygate)
    ./qualitygate.sh
    ;;

  prepareproject)
    ./prepareproject.sh
    ;;

  keptn)
    "$@"
    ;;

  *)
    echo "Abort: Invalid task type: $task"
    echo "values types are: qualitygate, prepareproject, keptn"
    ;;
esac
