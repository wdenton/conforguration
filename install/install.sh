#!/bin/bash
rsync --archive --delete ~/src/conforguration/conforg/ ${HOME}/conforg/

~/conforg/dotfiles/link-dotfiles.sh
