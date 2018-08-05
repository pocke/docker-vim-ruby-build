#!/bin/bash

set -xe

RB_VERSION=$1
RUBYINTERP_OPT=$2
if [ -z $RUBYINTERP_OPT ]; then
  SUFFIX=""
else
  SUFFIX="-${RUBYINTERP_OPT}"
fi
DIR=/vim-for-rubies/${RB_VERSION}${SUFFIX}
PATCH=/tmp/vim-patch-${RB_VERSION}${SUFFIX}.diff
TEST_LOG=/tmp/test-log-${RB_VERSION}${SUFFIX}
export PATH=/all-ruby/${RB_VERSION}/bin:$PATH

# make patch
cd $DIR
rev=$(git rev-parse @)
(
  cd /vim
  git diff $rev > $PATCH
)

# apply patch
git add .
git reset --hard
if [ -s $PATCH ]; then
  git apply $PATCH
fi
rm $PATCH

make -j
make install
cd src/
make test_ruby | tee $TEST_LOG
if grep FAILED < $TEST_LOG > /dev/null; then
  exit 1
fi
