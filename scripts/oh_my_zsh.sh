#!/bin/bash

install_zsh() {
  if [ ! -f /usr/bin/zsh ]; then
    echo "Installing zsh..."
    sudo apt-get install zsh || return $?
  fi
}

install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  [ -d $HOME/.oh-my-zsh ]
}

install_oh_my_zsh_custom() {
  git clone git@gitlab.com:h13ronim/oh-my-zsh-custom.git $HOME/.oh-my-zsh-custom || return $?
  mv $HOME/.zshrc $HOME/.zshrc.orig
  ln -sf $HOME/.oh-my-zsh-custom/zshrc $HOME/.zshrc
}

install_oh_my_zsh_work() {
  git clone git@gitlab.com:h13ronim/oh-my-zsh-work.git $HOME/.oh-my-zsh-work || return $?
}

set_zsh_as_default_shell() {
  chsh -s /usr/bin/zsh
}

install_customized_oh_my_zsh() {
  install_zsh || return $?
  install_oh_my_zsh || return $?
  install_oh_my_zsh_custom || return $?
  install_oh_my_zsh_work || return $?
  set_zsh_as_default_shell || return $?
}
