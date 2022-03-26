#!bash

case $- in
  *i*) ;;
    *) return ;;
esac

# ----------------------------------------- env variables -----------------------------------------

export REPOS="$HOME/repos"
export EDITOR="vim"
export DOTFILES="$HOME/.dotfiles"
export BROWSER=lynx
export TERM=xterm-256color

# -------------------------------------------- history --------------------------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# -------------------------------------------- prompt ---------------------------------------------

__ps1() {
  local P='$' dir="${PWD##*/}" B \
    r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$b($B) "

  PS1="$u$dir $B$p$P$x "
}

PROMPT_COMMAND="__ps1"

# -------------------------------------------- aliases --------------------------------------------
#                  (prefer exec scripts instead, which work from vim and subprocs)

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias sudo='sudo '
alias please="sudo"
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"

alias ls='ls -h --color=auto'
alias ll='ls -alF'
alias la='ls -A'

alias gs="git status"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gac="git add . && git commit"
alias graphme="git log --oneline --graph --decorate"

alias '?'="ddgr"
alias chmox='chmod +x'
alias dot='cd $DOTFILES'
alias myip="curl http://ipecho.net/plain; echo"
alias myips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias path='echo -e ${PATH//:/\\n}'
alias todo='$EDITOR $HOME/todo.md'
# ------------------------------------------- functions -------------------------------------------

function mkcd() {
  mkdir -p $@ &&cd ${@:$#}
}
