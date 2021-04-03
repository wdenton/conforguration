#!/bin/bash
script_dir='conforguration_scripts'
cd "$(dirname "$0")"

script_dir='conforguration_scripts'
mkdir -p ~/dotfiles/mine/ ~/dotfiles/imported/
cp -p mine/* ~/dotfiles/mine/
cp -p imported/* ~/dotfiles/imported/
cp -p link-dotfiles.sh ~/dotfiles/
