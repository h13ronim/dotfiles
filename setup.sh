#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`

main() {
  setup_basic_configs
  setup_youtube_dl_config
  setup_mpv_config
  assign_default_applications
}

setup_basic_configs() {
  for FILE in \
    gemrc \
    gitconfig \
    pryrc \
    rubocop.yml \
    vimrc.after \

  do
    ln -sf $D_R/configs/$FILE $HOME/.$FILE || return $?
  done
}

setup_youtube_dl_config() {
  mkdir -p $HOME/.config/youtube-dl/ || return $?
  ln -sf $D_R/configs/youtube-dl-config $HOME/.config/youtube-dl/config
}

setup_mpv_config() {
  if [ -d $HOME/.config/mpv ]; then
    rm -rf $HOME/.config/mpv || return $?
  fi
  ln -sf $D_R/configs/mpv $HOME/.config/mpv
}

assign_default_applications() {
  if [ ! -f /usr/local/bin/duti ]; then
    brew install duti
  fi
  for EXT in {avi,mkv,mp4}; do
    duti -s io.mpv "${EXT}" viewer
  done
}

main
