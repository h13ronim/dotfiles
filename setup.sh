#!/bin/bash

source scripts/git.sh
install_git || exit $?

mkdir -p $HOME/projects || exit $?

git clone git@gitlab.com:h13ronim/dotfiles.git $HOME/projects/dotfiles

cd $HOME/projects/dotfiles
