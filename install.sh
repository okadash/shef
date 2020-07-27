#!/bin/sh -e

SHELIB_ROOT=~/.shef

command -v git || { echo git not found; exit 1; }

test -d $SHELIB_ROOT/lib/core || {
  git clone https://github.com/okadash/shelib .tmp.core
  cd .tmp.core 
  ./install.sh && cd .. || { echo shelib installation failure; exit 1;}
  cd ..
}

test -d $SHELIB_ROOT/db && { echo shefpkg database exists; } || {
  cp -av db $SHELIB_ROOT/
}

test -d $SHELIB_ROOT/lib/shef && { echo shef is allready installed; exit 1; } || {
  cp -av lib $SHELIB_ROOT/lib/shef
  ./bin/shef install || cp -av bin/shef $SHELIB_ROOT/bin/
}
