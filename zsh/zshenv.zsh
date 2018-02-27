#!/bin/zsh
export XDG_CONFIG_HOME=~/config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh/dotdir

#load env
source $XDG_CONFIG_HOME/shells/env.sh

#load aliases
source $XDG_CONFIG_HOME/shells/maps.sh
