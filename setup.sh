#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`

for FILE in \
  gemrc \
  gitconfig \
  pryrc \
  rubocop.yml \
  vimrc.after \

do
  ln -sf $D_R/configs/$FILE $HOME/.$FILE || exit $?
done
