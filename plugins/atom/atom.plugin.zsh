#!/bin/bash

# Atom auto update doesn't work for me, so:
function atom-update() {
  brew update && \
  brew cask install --force atom && \
  rm -rf \
    $HOME/.atom/blob-store \
    $HOME/.atom/compile-cache \
    $HOME/.atom/recovery \
    $HOME/.atom/storage
}
