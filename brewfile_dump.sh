#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`

brew bundle dump --force --file=$D_R/configs/Brewfile."$(hostname -s)"
