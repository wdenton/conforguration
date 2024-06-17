#!/bin/bash
unset RUBY_VERSION
declare -a RUBY_VERSION=( '3.3.3' )
rbenv install --verbose $RUBY_VERSION
rbenv global $RUBY_VERSION
~/conforg/scripts/ruby-install-gems.sh
echo "Now run bundle install where needed (and perhaps bundle update --bundler)."
