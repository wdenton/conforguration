#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
cd ~/.rbenv/
git pull
cd plugins/ruby-build
git pull
