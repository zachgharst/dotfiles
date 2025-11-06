case $- in
  *i*) ;;
    *) return ;;
esac


# ----------------------------------- shopts -----------------------------------

shopt -s autocd
shopt -s cdspell


# -------------------------------- env variables -------------------------------

export BROWSER=lynx
export DOCUMENTS="$HOME/documents"
export DOWNLOADS="$HOME/downloads"
export EDITOR="nvim"
export GITHUB_USERNAME="zachgharst"
export REPOS="$HOME/repos"
export SCRIPTS="$HOME/scripts"
export TERM=xterm-256color

export MYGH="$REPOS/github.com/$GITHUB_USERNAME"
export DOTFILES="$MYGH/dotfiles"
export VAULT="$MYGH/vault"
export ZAX="$MYGH/zax"

export PATH="$PATH:$SCRIPTS/bin"

# dotnet
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$HOME/.dotnet:$HOME/.local/share/nvim/mason/packages/omnisharp:$PATH

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


# ----------------------------------- history ----------------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend


# ----------------------------------- prompt -----------------------------------

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


# ----------------------------------- aliases ----------------------------------
#        (prefer exec scripts instead, which work from vim and subprocs)

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dot='cd $DOTFILES'
alias gh="cd $MYGH"
alias repos="cd $REPOS"
alias scripts="cd $SCRIPTS"
alias vault="cd $VAULT"

alias sudo='sudo '
alias please="sudo"
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"

alias vi='\vim'
alias vim='$EDITOR'

alias ls='ls -h --color=auto'
alias ll='ls -alF'
alias la='ls -A'

alias ga="git add"
alias gac="git add . && git commit"
alias gap="git add -p"
alias gb="git branch"
alias gc="git commit"
alias gp="git push"
alias graphme="git log --oneline --graph --decorate"
alias gs="git status"

alias '?'="ddgr"
alias chmox='chmod +x'
alias c='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'
alias myip="curl http://ipecho.net/plain; echo"
alias myips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias path='echo -e ${PATH//:/\\n}'
alias todo='$EDITOR $DOCUMENTS/todo.md'


# ---------------------------------- functions ---------------------------------

function mkcd() {
  mkdir -p $@ &&cd ${@:$#}
}

function gittake() {
  path=$(echo $1 | sed -e "s/^https:\/\///" -e "s/^http:\/\///" -e "s/^www.//" | cut -f 1,2,3 -d "/")
  project=${2:-$(basename $path)}
  organization=$(basename $(dirname $path))
  domain=$(dirname $(dirname $path))
  parentDirectory="$REPOS/$domain/$organization"

  [[ "$domain" =~ "@" ]] && echo "fatal: prefer dumb protocol over smart (no username@)" && return 1

  mkdir -p $parentDirectory
  git clone $1 "$parentDirectory/$project"
  cd "$parentDirectory/$project"
}

nbom() {
  git checkout main
  git pull
  git checkout -b user/$GITHUB_USERNAME/"$1"
}


# ---------------------------------- complete ----------------------------------

complete -C pomo pomo


# ----------------------------------- colors -----------------------------------

[[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"


# ----------------------------------- import -----------------------------------

[[ -r "$HOME/.bashrc.microsoft" ]] && source "$HOME/.bashrc.microsoft"
[[ -r "$HOME/.bashrc.wsl" ]] && source "$HOME/.bashrc.wsl"
[[ -r "$HOME/.bashrc.private" ]] && source "$HOME/.bashrc.private"


# ---------------------------- program installation ----------------------------

# Rust
# . "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
