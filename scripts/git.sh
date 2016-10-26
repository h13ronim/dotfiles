#!/bin/bash

install_git() {
  which git > /dev/null
  if [ $? -gt 0 ]; then
    echo "Installing git..."
    sudo apt-get install git || return $?
  fi
}
