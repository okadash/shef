#!/bin/sh -e

SHEF_ROOT=~/.shef

command -v git || { echo git not found; exit 1; }

test -d $SHEF_ROOT/lib/core || {
  git clone https://github.com/okadash/shelib .tmp.core
  cd .tmp.core 
  ./install.sh && cd .. || { echo shelib installation failure; exit 1;}
  rm -rfv .tmp.core 
}

test -d $SHEF_ROOT/db && { echo shefpkg database exists; } || {
  cp -av db $SHEF_ROOT/
}

test -d $SHEF_ROOT/lib/shef && { echo shef is allready installed; exit 1; } || {
  cp -av lib $SHEF_ROOT/lib/shef
  cp -av bin/shef $SHEF_ROOT/bin/
}
