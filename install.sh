#!/bin/bash

source ./scripts/oh_my_zsh.sh
source ./scripts/git.sh
source ./scripts/macup.sh

install() {
  # install_git
  install_customized_oh_my_zsh
  # install_mackup
}

install
