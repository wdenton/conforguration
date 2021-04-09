#!/bin/bash
cd "$(dirname "$0")"
# echo "PWD is " $(pwd)

for dir in mine imported; do
    echo $dir
    cd $dir
    for file in *; do
	echo "  " $file
	rm -f ~/.${file}
	ln -s ~/conforg/dotfiles/${dir}/${file} ~/.${file}
    done
    cd ..
done

rm ~/.profile
ln -s ~/.bash_profile ~/.profile
