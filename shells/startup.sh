#!/bin/bash
source $XDG_CONFIG_HOME/shells/options.sh

# attach to tmux
if [[ ! $TERM =~ screen ]] && [[ $OPT_USE_TMUX -ne 0 ]]; then
	if tmux info &> /dev/null; then
		COMMAND=attach
		FLAG=-t $OPT_TMUX_SESSION_NAME
	else
		COMMAND=new
		FLAG=-s $OPT_TMUX_SESSION_NAME
	fi
    if [ -n "$OPT_TMUX_SESSION_NAME" ]; then
		tmux -2 $COMMAND $FLAG
	else
		tmux -2 $COMMAND
    fi
fi

# start ssh
if [ -z "$SSH_AUTH_SOCK" ] && [[ $OPT_START_SSH -ne 0 ]]; then
    eval `ssh-agent -s`
    ssh-add
fi

