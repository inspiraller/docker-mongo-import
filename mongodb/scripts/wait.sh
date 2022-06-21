#!/bin/bash

COUNTER=0
until nc -z mongo1 27017
do
  sleep 1
  COUNTER=$((COUNTER+1))
  if [[ ${COUNTER} -eq 30 ]]; then
    echo "Error: Mongo did not connect within 30 seconds."
    exit 2
  fi
  echo "Waiting for Mongo: ${COUNTER}/30 seconds"
done

echo "Success: mongo ready"
