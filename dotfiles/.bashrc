####
#### Small settings
####

umask 022

export EDITOR=nano
export VISUAL=nano

export WWW_HOME=https://duckduckgo.com/

####
#### Command history
####

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Ignore these commands
HISTIGNORE="ls:[bf]g:exit"

# Append to the history file, don't overwrite it.
shopt -s histappend

####
#### Window size
####

# Check window size after each command and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize

####
#### Misc
####

# "Modify the way the contents of a file are displayed in less. What
# this means is that less can automatically open up tar files,
# uncompress gzipped files, and even display something reasonable for
# graphics files.
eval "$(lessfile)"

####
#### Prompt
####

# Handy tool: http://xta.github.io/HalloweenBash/

# Colours
# http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"

WHITE='\e[0;37m'
LIGHT_GRAY="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
BLACK="\[\033[0;30m\]"

NO_COLOUR="\[\033[0m\]"

# Use blue prompt on my home machine(s), and red elsewhere.
# if [[ "$HOSTNAME" == "marcus" ]] ; then
#     PROMPT_COLOUR=$BLUE
# else
#     PROMPT_COLOUR=$LIGHT_RED
# fi

case $HOSTNAME in
    marcus)
	PROMPT_COLOUR=$BLUE
	;;
    shell)
	PROMPT_COLOUR=$GREEN
	;;
    *)
	PROMPT_COLOUR=$RED
esac

# Root is purple.
if [[ ${EUID} == 0 ]] ; then
    PROMPT_COLOUR=$PURPLE
fi

# \$ = # if root, $ otherwise; it needs to be escaped

#export PS1="\342\224\214\342\224\200[\@]\342\224\200[\u@\h]\n\342\224\224\342\224\200> \W \\$ "

# ┌─[07:47 PM]─[wtd@marcus:~]
# └─> $
# export PS1="\342\224\214\342\224\200[\@]\342\224\200[\u@\h:\w]\n\342\224\224\342\224\200> \\$ "

# ┌─[marcus]─[/usr/local/src/sonic-pi]
# └─> $
PS1="\342\224\214\342\224\200[\h]\342\224\200[\w]\n\342\224\224\342\224\200> \\$ "

PS1="${PROMPT_COLOUR}${PS1}${NO_COLOUR}"

# Glue the prompt to always go to the first column (http://jonisalonen.com/2012/your-bash-prompt-needs-this/)
PS1="\[\033[G\]$PS1"

if [[ "$TERM" == "dumb" ]] ; then
    PS1="$ "
fi

PS2="${PROMPT_COLOUR}\342\224\224> ${NO_COLOUR}"

####
#### Key remapping
####

# # I need to remap some keys on marcus, my Lenovo X240
# if [ -f ~/.Xmodmap ]; then
# xmodmap ~/.Xmodmap
# fi

####
#### Command aliases
####

alias f='finger -l'
alias grep='grep --color=auto'
alias o='libreoffice'
alias pi='alpine -i'
alias please='sudo'
alias rm="rm" # In case rm -i is set system-wide
alias scp="scp -p"
alias ww="curl http://wttr.in/yyz"
alias x='xdg-open'

# ls
export BLOCKSIZE=1024

if [[ $(uname) == "FreeBSD" ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias l='ls --classify --quoting-style=literal'
alias la='l --all'
alias ll='l -l'
alias lsort='l -l -S --reverse'

# Android stuff
alias android-connect='mtpfs -o allow_other /media/Nexus7'
alias android-disconnect='fusermount -u /media/Nexus7'

####
#### xterm title
####

# Puts wtd@hostname (or whatever) in the titlebar of an xterm.
# For it to change when you login to another
# machine, it needs to be in your .bashrc there too.
if [ "$TERM" = 'xterm' ] || [ "$TERM" = 'rxvt' ] || [ "$TERM" = 'xterm-256color' ]
then
    export PROMPT_COMMAND='echo -ne "\033]2;"`whoami`@`hostname -s`"\007"'
fi

####
#### Paging and less and more
####

# Requires GNU source-highlight
# $ sudo apt install libsource-highlight-common source-highlight

alias more='less'
alias mroe='more'

export PAGER=less

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

####
#### Small command-line functions and helpers
####

# Quick command-line Wikipedia lookup
function wp () {
    terms=$@
    lynx "https://en.wikipedia.org/wiki/$terms"
    # w3m "http://en.wikipedia.org/wiki/$terms"
}

# Pretty-print directory tree
function tree() {
    find "${1:-.}" -type d -print | sed -e 's:[ ]*/:|____:g;s:____|: |:g'
}

# "alert" alias for long running commands.  Eg: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Swap file $1 with $2
function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Handy way to watch a file grow
function monitor() {
    while true ; do
	clear
	tail "$1"
	sleep 10
    done
}

# "| order" is very handy for counting duplicated lines in a file or listing
function order() {
    sort | uniq -c | sort -rn
}

# Wipe all metadata from one or more images
function exifwipe() {
    for FILE in "$@"; do
	exiftool -all= "$FILE"
    done
}

# My SanDisk Clip Sport can't play 24-bit FLAC files
function sansify() {
    for FILE in "$@"; do
	sox "${FILE}" --bits 16 --rate 44.1k "16-${FILE}"
	rm "$FILE"
    done
}

# Sum a list of numbers
# E.g.
# $ for I in *txt; do cat $I | wc -l; done | colsum
function colsum {
    paste -s -d+ | bc --
}

####
#### Completions
####

# Git.  Can be found as part of Git source.
source ~/.git-completion.bash

# Bash.  Requires bash-completion package.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

####
#### Solarized theme
####

# Apply a solarized theme to xterms. Helps with color ls listings, etc.
# See https://github.com/seebi/dircolors-solarized
# I'm using dircolors.ansi-dark
eval $(dircolors ~/.dircolors.ansi-dark)

# Also use solarized theme in GNOME terminal
# See https://github.com/sigurdga/gnome-terminal-colors-solarized

####
#### Emacs-related
####

# Open a dired window for the current directory
dired() {
    emacsclient -e "(dired \"$PWD\")"
}

# Can also just use "e ." to load . in emacsclient

####
#### $PATH
####

# Do /usr/local/bin first
PATH=/usr/local/bin:$PATH

# Make sure rootly path is there
PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin

# Emacs is run from source in /usr/local/src/emacs
PATH=/usr/local/src/emacs/src:$PATH
alias emacsclient="/usr/local/src/emacs/lib-src/emacsclient"
alias e="emacsclient --no-wait"

# Running R from source in /usr/local/src/R
if [ -f /usr/local/src/R/R ] ; then
    PATH=/usr/local/src/R:$PATH
fi

# Zotero 5.0 ... if this becomes a package I won't need to
# manage it manually
alias zotero="/usr/local/src/zotero/Zotero_linux-x86_64/zotero"

# I put ircii's irc in ~/.irc/
PATH=$PATH:~/.irc/

# Ruby: I'm using rbenv instead of RVM now
# If rbenv isn't there, just default to system Ruby
if [ -d ~/.rbenv/ ] ; then
    PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

# Go (go help gopath)
export GOPATH=~/.gopath
PATH=$PATH:$GOPATH/bin/

# Pip
PATH=$PATH:~/.local/bin/

# My own scripts, and finally, the current directory.
PATH=$PATH:~/bin/:.

####
#### Machine-specific settings
####

# If the machine is named dartagnan, put machine-specific environment
# variables and settings in ~/.bash.dartagnan.rc

if [ -f ~/.bash.$HOSTNAME.rc ] ; then
    . ~/.bash.$HOSTNAME.rc
fi
