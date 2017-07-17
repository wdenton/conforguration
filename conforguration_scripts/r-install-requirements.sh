#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
sudo apt-get install libbz2-dev liblzma-dev libpcre3-dev fonts-inconsolata
sudo apt-get install xorg-dev gfortran libreadline-dev libcurl4-openssl-dev libssl-dev
sudo apt-get build-dep r-base
sudo apt-get install libgsl-dev
mkdir -p ~/R/history/
sudo mkdir -p /usr/local/src/R
