#!/bin/bash
set -xe

RB_VERSION=$1
DIR=/vim-for-rubies/${RB_VERSION}
export PATH=/all-ruby/${RB_VERSION}/bin:$PATH

git clone /vim-on-docker-build $DIR
cd $DIR
./configure --prefix=/usr --with-features=huge --enable-rubyinterp=yes
make -j
cd src/
make test_ruby
