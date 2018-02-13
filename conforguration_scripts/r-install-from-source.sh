#!/bin/bash
script_dir='conforguration_scripts'
dotfiles_dir='dotfiles'
unset R_VERSION
declare -a R_VERSION=( '3.4.3' )
<<r_source_code_present_and_compiled>>
sudo make install

echo "Wrap in su here"
RSCRIPT=Rscript
<<r_install_packages>>
