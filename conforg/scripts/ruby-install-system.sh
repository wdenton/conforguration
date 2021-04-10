#!/bin/bash
unset RUBY_VERSION
declare -a RUBY_VERSION=( '3.0.1' )
mkdir -p /usr/local/src/ruby
cd /usr/local/src/ruby

curl -LO https://cache.ruby-lang.org/pub/ruby/2.7/ruby-${RUBY_VERSION}.tar.gz
tar xzvf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

./configure
make

sudo make install
sudo ~/conforg/scripts/ruby-install-gems.sh

echo "Now run bundle install where needed."
