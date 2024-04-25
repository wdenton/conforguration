#!/bin/bash
unset RUBY_VERSION
declare -a RUBY_VERSION=( '3.3.1' )
mkdir -p /usr/local/src/ruby
cd /usr/local/src/ruby

# The 3.0.2.tar.gz tarball is in the 3.0/ directory, for example.
MINOR_VERSION=$(echo ${RUBY_VERSION} | sed 's/\.[[:digit:]]$//')

curl --location --remote-name https://cache.ruby-lang.org/pub/ruby/${MINOR_VERSION}/ruby-${RUBY_VERSION}.tar.gz
tar xzvf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

./configure
make

sudo make install
sudo ~/conforg/scripts/ruby-install-gems.sh

echo "Now run bundle install where needed (and perhaps bundle update --bundler)."
