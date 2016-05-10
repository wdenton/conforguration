#!/bin/sh
DOTFILES="bashrc dircolors.ansi-dark gemrc git-completion.bash profile"
for DOTFILE in $DOTFILES; do
  rm -f ~/.${DOTFILE}
  ln -s ~/dotfiles/.${DOTFILE} ~/.${DOTFILE}
done
