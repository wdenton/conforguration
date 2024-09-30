#!/bin/bash
cd /usr/local/src/emacs/
git pull
./configure --with-pgtk --with-tree-sitter && make -j && cd ../org-mode/ && make -j update
