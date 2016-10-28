#!/bin/bash

PROVISIONING_HOME=$(cd $(dirname $0) && pwd)
ANSIBLE_VERSION=$(echo $(ansible --version) | cut -d" " -f2)

function show_context() {
  echo "PROVISIONING_HOME=${PROVISIONING_HOME}"
  echo "ANSIBLE_VERSION=${ANSIBLE_VERSION}"
}

show_context
