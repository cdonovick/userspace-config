#!/bin/zsh


# Lines configured by zsh-newuser-install
HISTFILE=$XDG_CONFIG_HOME/zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history #incremental history
unsetopt share_history
setopt hist_ignore_all_dups

setopt notify

unsetopt autocd beep
bindkey -e
autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

# PIP completion
eval "`pip completion --zsh`"


setopt extended_glob
ZSH_CACHE_DIR=$XDG_CONFIG_HOME/zsh/cache
#  :completion:<func>:<completer>:<command>:<argument>:<tag>
#menu
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:*:*:*:*(files|directories)' group-order '*directories' '*files'

#fuzz
zstyle ':completion:*' completer _complete _correct #_approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
#zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

#cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

#ignore
zstyle ':completion:*:*:*:*:*(files|directories)' ignored-patterns '(__pycache__|*.pyc)'

# show ignored
zstyle '*' single-ignored show


PROMPT="%n@%m:%(5~|…/%4~|%~)%# "

