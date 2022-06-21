#!/bin/bash

ENV_DB=""
ENV_TABLE=""
ENV_USER=""
ENV_PASS=""
ENV_HOST="mongo1"
if [ $# -gt 1 ]; then
  ENV_DB="$1"
  ENV_TABLE="$2"
  ENV_USER="$3"
  ENV_PASS="$4"
fi

echo "Mongo import csv ${ENV_DB} ${ENV_TABLE} ${ENV_USER} ${ENV_PASS}"

# mongoimport -h "${ENV_HOST}:27017" -u "${ENV_USER}" -p "${ENV_PASS}" -c $ENV_TABLE --authenticationDatabase ${ENV_DB} --type csv --file ./latest.csv --columnsHaveTypes --fieldFile=./field_file_types.txt 
# mongoimport  --uri "mongodb://${ENV_USER}:${ENV_PASS}@mongo1/${ENV_DB}" -c $ENV_TABLE --type csv --file ./latest.csv --columnsHaveTypes --fieldFile=./field_file_types.txt 
mongoimport -h "${ENV_HOST}:27017" -u "${ENV_USER}" -p "${ENV_PASS}" -d "${ENV_DB}" -c $ENV_TABLE --type csv --file ./latest.csv --columnsHaveTypes --fieldFile=./field_file_types.txt 
exit 0