#!/bin/bash

which git > /dev/null
if [ $? -gt 0 ]; then
  echo "Installing git..."
  sudo apt-get install git || exit $?
fi

mkdir -p $HOME/projects || exit $?

git clone git@gitlab.com:h13ronim/dotfiles.git $HOME/projects/dotfiles

echo "go to ~/projects/dotfiles and run ./install.sh"
