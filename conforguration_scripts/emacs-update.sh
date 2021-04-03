#!/bin/bash
script_dir='conforguration_scripts'
cd /usr/local/src/emacs/
git pull
./configure && make
cd ../org-mode/
make update
