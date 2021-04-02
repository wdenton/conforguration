#!/bin/bash
cd "$(dirname "$0")"

mkdir -p ~/dotfiles/mine/
mkdir -p ~/dotfiles/imported/
cp -p mine/* ~/dotfiles/mine/
cp -p imported/* ~/dotfiles/imported/
cp -p install-dotfiles.sh ~/dotfiles/
