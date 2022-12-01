#!/bin/bash
sudo apt-get build-dep emacs
sudo apt-get install libjansson-dev valgrind fonts-firacode libgccjit0 libgccjit-11-dev
## On Linux Mint, at least, these are not installed when the above is done.  Curious.
## On other systems, it can't hurt.
sudo apt-get install texinfo libxpm-dev libjpeg-dev libgif-dev libtiff-dev libtinfo-dev
