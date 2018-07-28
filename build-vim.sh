#!/bin/bash

cd /vim
set -xe
export PATH=/all-ruby/$1/bin:$PATH
git clean -xf
./configure --prefix=/usr --with-features=huge --enable-rubyinterp=yes
make -j
make install
cd src/
make test_ruby
