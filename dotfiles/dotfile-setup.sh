#!/bin/sh
DOTFILES=".[a-zA-Z]*"
for DOTFILE in $DOTFILES; do
  rm -f ~/${DOTFILE}
  ln -s ~/$dotfiles_dir/${DOTFILE} ~/${DOTFILE}
done
rm ~/.profile
ln -s ~/.bash_profile ~/.profile
