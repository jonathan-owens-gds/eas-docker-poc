#!/bin/bash

if [[ -z $1 ]]; then
  exit "Service name must be provided"
fi;

SERVICE=$1

function activate_virtual_env(){
  echo "Activating virtual env $VENV_ROOT/$SERVICE/bin/activate";
  . $VENV_ROOT/$SERVICE/bin/activate
}

function start_service(){
  echo "Starting service $SERVICE"
  systemctl start $SERVICE || true;
}

function validate_service(){
  echo "Validating service:";

  service_status=$(systemctl status $SERVICE);

  if echo $service_status | grep -q 'active'; then
    echo "Service $SERVICE is active";
  else
    echo "Starting service $SERVICE";
    systemctl start $SERVICE || true;
  fi
}

if [[ $(printenv DEBUG) != true ]]; then
  activate_virtual_env
  start_service
  validate_service
else
  echo "Script will not execute, Debug mode enabled...";
fi;