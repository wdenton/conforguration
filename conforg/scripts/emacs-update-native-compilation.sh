#!/bin/bash
cd /usr/local/src/emacs/
git pull
./configure --with-json --with-pgtk --with-tree-sitter --with-native-compilation=aot && make -j && cd ../org-mode/ && make -j update
