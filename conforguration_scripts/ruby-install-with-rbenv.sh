#!/bin/bash
script_dir='conforguration_scripts'
unset RUBY_VERSION
declare -a RUBY_VERSION=( '3.0.0' )
rm -rf ~/.rbenv/
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.bashrc
rbenv install --verbose $RUBY_VERSION
rbenv global $RUBY_VERSION
./ruby-install-gems.rb
echo "Now run bundler install where needed."
