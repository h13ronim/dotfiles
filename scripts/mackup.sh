#!/bin/bash

install_mackup() {
  sudo apt-get install python-pip || return $?
  sudo pip install mackup
}

set_mackup_config() {
  cp $HOME/projects/dotfiles/configs/.mackup.cfg $HOME/.mackup.cfg
}

install_customized_mackup() {
  install_mackup || return $?
  set_mackup_config
  echo "run mackup restore"
}
