#!/bin/bash

function start_postgres(){
  echo "Starting postgres"
  su postgres && service postgresql start || true;
}

function validate_db_service(){
  echo "Validating postgres service:";

  service_status=$(service postgresql status);

  if echo $service_status | grep -q 'online'; then
    echo "Service postgresql is active";
  else
    start_postgres
  fi
}

function update_sending_address(){
  query="update services set email_from = '$(printenv EMAIL_PREFIX)' where id='d6aa2c68-a2d9-4437-ab19-3ae8eb202553';"
  su postgres && psql -d emergency_alerts -c "$query"

  if [ -z "$EMAIL_PREFIX" ]; then
    echo "Email prefix environment variable is required e.g. lewis.stevens"
    exit 1;
  fi;
}

if [[ $(printenv DEBUG) != true ]]; then
  start_postgres
  validate_db_service
  update_sending_address
else
  echo "Script will not execute, Debug mode enabled...";
fi;