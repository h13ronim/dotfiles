#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`
HOSTNAME=$(hostname -s)

main() {
  brewfile_dump
  atom_packages_dump
}

atom_packages_dump() {
  [ -f /usr/local/bin/apm ] && apm list --installed --bare > $D_R/configs/atom/packages.$HOSTNAME
}

brewfile_dump() {
  brew bundle dump --force --file=$D_R/configs/Brewfile.$HOSTNAME
}

main
