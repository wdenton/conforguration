#!/bin/bash
cd /usr/local/src/emacs/
git pull
./configure --with-json --with-pgtk --with-tree-sitter --with-native-compilation && make -j 8
cd ../org-mode/
make -j 8 update
