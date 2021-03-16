#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset RUBY_VERSION
declare -a RUBY_VERSION=( '3.0.0' )
rm -rf ~/.rbenv/
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.bashrc
rbenv install --verbose $RUBY_VERSION
rbenv global $RUBY_VERSION
gem install marc nokogiri sqlite3 rubocop bundler jekyll rubyul docopt pry pry-doc http
echo "Now run bundler install where needed."
