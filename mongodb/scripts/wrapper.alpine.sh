#!/bin/bash

# Start the first process
source ./wait.sh "$@" &&
  
# Start the second process
source ./import.sh "$@" &&
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?