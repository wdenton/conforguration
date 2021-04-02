#!/bin/bash
script_dir='conforguration_scripts'
unset RUBY_VERSION
declare -a RUBY_VERSION=( '3.0.0' )
rbenv install --verbose $RUBY_VERSION
rbenv global $RUBY_VERSION
./ruby-install-gems.sh
echo "Now run bundler install where needed."
