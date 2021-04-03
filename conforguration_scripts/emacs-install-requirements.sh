#!/bin/bash
script_dir='conforguration_scripts'
sudo apt-get build-dep emacs
sudo apt-get install libjansson-dev valgrind fonts-firacode
## On Linux Mint, at least, these are not installed when the above is done.  Curious.
## On other systems, it can't hurt.
sudo apt-get install texinfo libxpm-dev libjpeg-dev libgif-dev libtiff-dev libtinfo-dev
