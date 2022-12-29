#!/bin/bash
cd /usr/local/src/emacs/
git pull
./configure --with-json --with-pgtk --with-native-compilation=aot && make -j 8
cd ../org-mode/
make -j 8 update