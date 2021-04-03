#!/bin/bash
cd "$(dirname "$0")"

mkdir -p ~/dotfiles/mine/ ~/dotfiles/imported/
cp -p mine/* ~/dotfiles/mine/
cp -p imported/* ~/dotfiles/imported/
cp -p link-dotfiles.sh ~/dotfiles/
