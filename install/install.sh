#!/bin/bash
cd "$(dirname "$0")"
./copy-dotfiles.sh
~/conforg/dotfiles/link-dotfiles.sh
./copy-scripts.sh
