#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")"
sudo ln -snf $DIR/include /usr/local/include/Color
make lib
sudo ln -s $DIR/lib/* /usr/local/lib/
