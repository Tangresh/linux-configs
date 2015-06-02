alias ls='ls --color=auto'
alias ll='ls -lahF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias e="emacs -nw"
alias ew="emacs"

alias drm='docker ps -a | grep '"'"'weeks ago'"'"' | awk '"'"'{print $1}'"'"' | xargs --no-run-if-empty docker rm'
alias drmi='docker images | grep "<none>" | awk '"'"'{print $3}'"'"' | xargs docker rmi'
