#!/bin/bash

install_vim_janus() {
  curl -L https://bit.ly/janus-bootstrap | bash
}

install_spell_checking() {
  vim "+set spell" +qall
}
