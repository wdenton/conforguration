#!/bin/bash
cd /usr/local/src/
git clone https://git.savannah.gnu.org/git/emacs.git
cd emacs
./autogen.sh
./configure
make

cd /usr/local/src/
git clone https://git.savannah.gnu.org/git/emacs/org-mode.git
cd org-mode
make

cd
git clone git@github.com:wdenton/.emacs.d.git
# Or if you don't want to use a GitHub account:
# git clone https://github.com/wdenton/.emacs.d.git
echo "Now run emacs, and say no when asked about a location for abbrev_defs."
