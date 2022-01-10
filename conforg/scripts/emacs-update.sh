#!/bin/bash
cd /usr/local/src/emacs/
git pull
./configure --with-json && make
cd ../org-mode/
make update
