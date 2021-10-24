#!/usr/bin/env zsh

cd "$(dirname "${ZSH_SOURCE}")";

sudo apt install git
git pull origin master;

rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~;

source ~/.zshrc;