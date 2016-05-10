#!/bin/sh
script_directory='conforguration_scripts'
DOTFILES=".[a-zA-Z]*"
for DOTFILE in $DOTFILES; do
  rm -f ~/${DOTFILE}
  ln -s ~/dotfiles/${DOTFILE} ~/${DOTFILE}
done
