#!/bin/bash

# Start the first process
sh ./wait.sh "$@" &&
  
# Start the second process
sh ./import.sh "$@" &&
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?