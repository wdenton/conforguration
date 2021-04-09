#!/bin/bash
cd /usr/local/src/emacs/
git pull
./configure && make
cd ../org-mode/
make update
