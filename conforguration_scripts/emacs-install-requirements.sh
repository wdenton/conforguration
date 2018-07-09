#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
sudo apt-get build-dep emacs
## On Linux Mint, at least, these are not installed when the above is done.  Curious.
## On other systems, it can't hurt.
sudo apt-get install texinfo install libxpm-dev libjpeg-dev libgif-dev libtiff-dev libtinfo-dev
