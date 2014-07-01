bind "set completion-ignore-case on"

alias e="emacs -nw"
alias ew="emacs"

manpdf(){
  man -t "$1" | ps2pdf - "$1.pdf"
}
