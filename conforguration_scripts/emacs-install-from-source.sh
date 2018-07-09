#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
cd /usr/local/src/
# Emacs
git clone https://git.savannah.gnu.org/git/emacs.git
cd emacs
./autogen.sh
./configure
make
# Org
cd /usr/local/src/
git clone https://code.orgmode.org/bzg/org-mode.git
cd org-mode
make
# My config
cd
git clone git@github.com:wdenton/.emacs.d.git
echo "Now run emacs, and say no when asked about a location for abbrev_defs."

script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
cd /usr/local/src/
# Emacs
git clone https://git.savannah.gnu.org/git/emacs.git
cd emacs
./autogen.sh
./configure
make
# Org
cd /usr/local/src/
git clone https://code.orgmode.org/bzg/org-mode.git
cd org-mode
make
# My config
cd
git clone git@github.com:wdenton/.emacs.d.git
echo "Now run emacs, and say no when asked about a location for abbrev_defs."
