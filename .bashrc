#
# ~/.bashrc
#

PATH=~/bin:$PATH
export PATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

####################
# Interactive only #
####################

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

bind "set completion-ignore-case on"

export EDITOR="emacs -nw"
export SVN_EDITOR=$EDITOR

manpdf(){
  man -t "$1" | ps2pdf - "$1.pdf"
}

. ~/.gitrc
