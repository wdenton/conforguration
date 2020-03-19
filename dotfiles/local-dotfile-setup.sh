#!/bin/sh
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
cp -r ../dotfiles/ ~/
cd ~/dotfiles/
./dotfile-setup.sh
