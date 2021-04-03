#!/bin/bash
script_dir='conforguration_scripts'
cd /usr/local/src/
git clone https://git.savannah.gnu.org/git/emacs.git
cd emacs
./autogen.sh
./configure
make

script_dir='conforguration_scripts'
cd /usr/local/src/
git clone https://code.orgmode.org/bzg/org-mode.git
cd org-mode
make

script_dir='conforguration_scripts'
cd
git clone git@github.com:wdenton/.emacs.d.git
# Or
# git clone https://github.com/wdenton/.emacs.d.git
# if you don't want to use a GitHub account.
echo "Now run emacs, and say no when asked about a location for abbrev_defs."
