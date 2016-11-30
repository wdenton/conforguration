#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
cd /usr/local/src/
# Emacs
git clone git://git.savannah.gnu.org/emacs.git
cd emacs
./autogen.sh
./configure
make
# Org
cd /usr/local/src/
git clone git://orgmode.org/org-mode.git
cd org-mode
make
# My config
cd
git clone git@github.com:wdenton/.emacs.d.git
