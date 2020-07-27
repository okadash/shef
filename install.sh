#!/bin/sh -e

command -v git || { echo git not found; exit 1; }

test -d ~/.shef/lib/core || {
  git clone https://github.com/okadash/shelib .tmp.core
  cd .tmp.core 
  ./install.sh && cd .. || { echo shelib installation failure; exit 1;}
  cd ..
}

test -d ~/.shef/lib/shef && { echo shef is allready installed; exit 1; } || {
  cp -av lib ~/.shef/lib/shef
  ./bin/shef install || cp -av bin/shef ~/.shef/bin/
}
