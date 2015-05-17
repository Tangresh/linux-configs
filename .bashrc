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

export SVN_EDITOR="emacs -nw"

manpdf(){
  man -t "$1" | ps2pdf - "$1.pdf"
}

. ~/.gitrc
