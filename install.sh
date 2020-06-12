#!/bin/sh

command -v git || { echo git not found; exit 1; }

git clone https://github.com/okadash/shelib .tmp.core
cd .tmp.core 
./install.sh
test -d ~/.shef/lib/shef && { echo shef is allready installed; exit 1; }
cp -av lib ~/.shef/lib/shef
./bin/shef install
