#!/bin/bash
if [[ -d ~/.rbenv ]]; then
    # rbenv is already installed, so upgrade it
    echo "Upgrading"
    cd ~/.rbenv/
    git pull
    cd plugins/ruby-build
    git pull
else
    echo "Installing"
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    source ~/.bashrc
fi
