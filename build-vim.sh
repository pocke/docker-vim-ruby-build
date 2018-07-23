#!/bin/bash

set -xe
export PATH=/all-ruby/$1/bin:$PATH
git clean -xf
./configure --prefix=/usr --with-features=huge --enable-rubyinterp=yes
make -j
make install
