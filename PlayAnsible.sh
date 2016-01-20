#!/bin/bash

. Context.sh
show_context

TASK_NAME=$(basename $0)
function pa_echo () {
  echo [${TASK_NAME}] $1
}

cd ${PROVISIONING_HOME}/provisioning > /dev/null 2>&1

pa_echo "Doing common playbook"
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook playbook.yml -i hosts

osascript -e 'display notification "Successfull please restart or re-login" with title "osx-provisioning"'
