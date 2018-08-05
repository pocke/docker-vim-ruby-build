#!/bin/bash

set -xe

if [ "${1}" != 'no18' ]; then
  build-vim.sh 1.8.7-p374
  build-vim.sh 1.8.7-p374 dynamic
fi
build-vim.sh 1.9.3-p551
build-vim.sh 1.9.3-p551 dynamic
build-vim.sh 2.0.0-p648
build-vim.sh 2.0.0-p648 dynamic
build-vim.sh 2.1.10
build-vim.sh 2.1.10 dynamic
build-vim.sh 2.2.10
build-vim.sh 2.2.10 dynamic
build-vim.sh 2.3.7
build-vim.sh 2.3.7 dynamic
build-vim.sh 2.4.4
build-vim.sh 2.4.4 dynamic
build-vim.sh 2.5.1
build-vim.sh 2.5.1 dynamic
