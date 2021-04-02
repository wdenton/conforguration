#!/bin/bash
script_dir='conforguration_scripts'
if [[ -d ~/.rbenv ]]; then
    # rbenv is already installed, so upgrade it
    cd ~/.rbenv/
    git pull
    cd plugins/ruby-build
    git pull
    echo "rbenv upgraded"
else
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    source ~/.bashrc
    echo "rbenv installed"
fi
