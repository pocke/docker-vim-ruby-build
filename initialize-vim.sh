#!/bin/bash
set -xe

RB_VERSION=$1
RUBYINTERP_OPT=$2
if [ $RUBYINTERP_OPT = 'yes' ]; then
  SUFFIX=''
else
  SUFFIX="-${RUBYINTERP_OPT}"
fi
DIR=/vim-for-rubies/${RB_VERSION}${SUFFIX}
export PATH=/all-ruby/${RB_VERSION}/bin:$PATH

git clone /vim-on-docker-build $DIR
cd $DIR
./configure --prefix=/usr --with-features=huge --enable-rubyinterp=${RUBYINTERP_OPT}
make -j
cd src/
make test_ruby
