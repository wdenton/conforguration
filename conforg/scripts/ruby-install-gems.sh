#!/bin/bash
GEM_LIST="awesome_print bundler docopt http marc nokogiri pry pry-doc rubocop rubyul sqlite3"
for gem in $GEM_LIST
do
    gem install $gem
done
