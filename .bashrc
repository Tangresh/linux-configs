bind "set completion-ignore-case on"

export ALTERNATE_EDITOR=""

alias e="emacsclient -t"
alias ew="emacsclient -c -n"

manpdf(){
  man -t "$1" | ps2pdf - "$1.pdf"
}


