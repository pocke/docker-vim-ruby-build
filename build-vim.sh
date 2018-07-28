#!/bin/bash

set -xe

RB_VERSION=$1
DIR=/vim-for-rubies/${RB_VERSION}
PATCH=/tmp/vim-patch-$RB_VERSION.diff
TEST_LOG=/tmp/test-log-$RB_VERSION
export PATH=/all-ruby/$1/bin:$PATH

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
git apply $PATCH
rm $PATCH

make -j
make install
cd src/
make test_ruby | tee $TEST_LOG
if grep FAILED < $TEST_LOG > /dev/null; then
  exit 1
fi
