#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")"
sudo ln -snf $DIR/include /usr/local/include/Color
make lib
sudo ln -sf $DIR/lib/libstealthcolor.so /usr/local/lib/libstealthcolor.so
