#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset RUBY_VERSION
declare -a RUBY_VERSION=( '2.5.1' )
mkdir -p /usr/local/src/ruby
cd /usr/local/src/ruby

curl -LO https://cache.ruby-lang.org/pub/ruby/2.5/ruby-${RUBY_VERSION}.tar.gz
tar xzvf ruby-${RUBY_VERSION}.tar.gz
cd ruby-${RUBY_VERSION}

./configure
make

sudo make install
sudo gem install marc nokogiri sqlite3 rubocop bundler rubyul

echo "Now run bundler install where needed."
