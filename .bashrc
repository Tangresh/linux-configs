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

         RED="\[\033[0;31m\]"
       GREEN="\[\033[0;32m\]"
      YELLOW="\[\033[0;33m\]"
        BLUE="\[\033[0;34m\]"
       WHITE="\[\033[1;37m\]"
   LIGHT_RED="\[\033[1;31m\]"
 LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
  LIGHT_BLUE="\[\033[1;34m\]"
  LIGHT_GRAY="\[\033[0;37m\]"
  COLOR_NONE="\[\e[0m\]"

SYM_TICK="\342\234\223"
SYM_CROSS="\342\234\227"
SYM_HLINE="\342\224\200"
SYM_CORNER_TL="\342\224\214"
SYM_CORNER_BL="\342\224\224"

. ~/.gitrc

function cmd_prompt() {
    declare prompt
    if [[ $1 == 0 ]]
    then
        prompt="${GREEN}${SYM_TICK}"
    else
        prompt="${RED}${SYM_CROSS}($1)"
    fi
    echo $prompt
}

#PS1="\[\033[01;33m\]\D{%Y-%m-%d %H:%M} \[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
function prompt_func() {
    EXIT_STATUS=$?

    declare -a lines=()

    declare -a line1=()
    line1+=("${LIGHT_GRAY}${SYM_CORNER_TL}${SYM_HLINE}")
    line1+=("${YELLOW}\D{%Y-%m-%d %H:%M} ${GREEN}\u${LIGHT_GREEN}@\h ${LIGHT_BLUE} \w")
    printf -v lines[0] '%s ' "${line1[@]}"

    declare -a line2=()
    line2+=("${LIGHT_GRAY}${SYM_CORNER_BL}${SYM_HLINE}${SYM_HLINE}>")
    line2+=($(git_prompt))
    line2+=($(cmd_prompt ${EXIT_STATUS}))
    printf -v lines[1] '%s ' "${line2[@]}"

    printf -v prompt '%s\n' "${lines[@]}"
    PS1=${prompt:0:(-1)}"${COLOR_NONE}"
}
PROMPT_COMMAND=prompt_func
