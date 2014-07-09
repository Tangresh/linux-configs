bind "set completion-ignore-case on"

export SVN_EDITOR="emacs -nw"

manpdf(){
  man -t "$1" | ps2pdf - "$1.pdf"
}
