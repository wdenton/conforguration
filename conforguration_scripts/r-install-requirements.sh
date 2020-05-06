#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
sudo apt-get install libbz2-dev liblzma-dev libxml2-dev libpcre2-dev libpcre3-dev fonts-inconsolata
sudo apt-get install xorg-dev gfortran libreadline-dev libcurl4-openssl-dev libssl-dev libgsl-dev libcurl4-openssl-dev
sudo apt-get curl build-dep r-base
mkdir -p ~/R/history/
mkdir -p /usr/local/src/R
