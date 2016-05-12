#!/bin/sh
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
mkdir -p ~/$dotfiles_dir
DOTFILES=".[a-zA-Z]*"
for DOTFILE in $DOTFILES; do
  rm -f ~/${DOTFILE}
  ln -s ~/$dotfiles_dir/${DOTFILE} ~/${DOTFILE}
done
