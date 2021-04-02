#!/bin/bash
script_dir='conforguration_scripts'
cd "$(dirname "$0")"
# echo "PWD is " $(pwd)

script_dir='conforguration_scripts'
for dir in mine imported; do
    echo $dir
    cd $dir
    for file in *; do
	echo "  " $file
	rm -f ~/.${file}
	ln -s ~/dotfiles/${dir}/${file} ~/.${file}
    done
    cd ..
done

script_dir='conforguration_scripts'
rm ~/.profile
ln -s ~/.bash_profile ~/.profile
