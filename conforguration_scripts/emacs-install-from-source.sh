#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset RUBY_VERSION
declare -a RUBY_VERSION=( '2.3.3' )
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
# Install use-package
emacs -q --batch -l ~/.emacs.d/setup/bootstrap.el
