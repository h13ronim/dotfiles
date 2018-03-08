#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`
HOSTNAME=$(hostname -s)

main() {
  brewfile_dump
  atom_packages_dump
}

brewfile_dump() {
  brew bundle dump --force --file=$D_R/configs/Brewfile.$HOSTNAME
}

atom_packages_dump() {
  apm list --installed --bare > $D_R/configs/atom/packages.$HOSTNAME
}

main
