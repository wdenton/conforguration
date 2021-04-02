#!/bin/bash
script_dir='conforguration_scripts'
unset RUBY_VERSION
declare -a RUBY_VERSION=( '3.0.0' )
mkdir -p /usr/local/src/ruby
cd /usr/local/src/ruby

curl -LO https://cache.ruby-lang.org/pub/ruby/2.7/ruby-${RUBY_VERSION}.tar.gz
tar xzvf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

./configure
make

sudo make install
sudo ./ruby-install-gems.rb

echo "Now run bundler install where needed."
