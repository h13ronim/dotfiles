#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`

main() {
  setup_basic_configs
  setup_youtube_dl_config
  setup_mpv_config
  setup_atom_config
  setup_oh_my_zsh
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

setup_atom_config() {
  mkdir -p $HOME/.atom || return $?
  ln -sf $D_R/configs/atom/config.cson $HOME/.atom/config.cson
  ln -sf $D_R/configs/atom/styles.less $HOME/.atom/styles.less
}

setup_oh_my_zsh() {
  if [ -d $HOME/.oh-my-zsh-custom ]; then
    rm -rf $HOME/.oh-my-zsh-custom || return $?
  fi
  ln -sf $D_R/configs/oh-my-zsh-custom $HOME/.oh-my-zsh-custom
}

assign_default_applications() {
  if [ ! -f /usr/local/bin/duti ]; then
    brew install duti || return $?
  fi

  SOURCE_CODE_EXTS=(conf js rb sh md)
  MOVIE_EXTS=(avi mkv mp4)

  for EXT in ${MOVIE_EXTS[*]}; do
    duti -s io.mpv "${EXT}" viewer || return $?
  done

  for EXT in ${SOURCE_CODE_EXTS[*]}; do
    duti -s com.github.atom "${EXT}" editor || return $?
  done
}

main
