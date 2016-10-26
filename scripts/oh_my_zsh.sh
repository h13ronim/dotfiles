#!/bin/bash

install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  [ -d $HOME/.oh-my-zsh ]
}

install_custom_oh_my_zsh() {
  git clone git@github.com:h13ronim/oh-my-zsh-custom.git $HOME/.oh-my-zsh-custom || return $?
  mv $HOME/.zshrc $HOME/.zshrc.orig
  ln -sf $HOME/.oh-my-zsh-custom/zshrc $HOME/.zshrc
}

install_customized_oh_my_zsh() {
  install_oh_my_zsh || return $?
  install_custom_oh_my_zsh || return $?
}
