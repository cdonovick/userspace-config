#!/bin/bash
source options.sh

# attach to tmux
if [[ ! $TERM =~ screen ]] && [ "$OPT_USE_TMUX" -ne 0 ]; then
    if [ -n "$OPT_TMUX_SESSION_NAME" ]; then
        tmux -2 attach -t $OPT_TMUX_SESSION_NAME || tmux -2 new -s $OPT_TMUX_SESSION_NAME
    else
        tmux -2 attach || tmux -2
    fi
fi

# start ssh
if [ -z "$SSH_AUTH_SOCK" ] && [ "$OPT_START_SSH" -ne 0 ]; then
    eval `ssh-agent -s`
    ssh-add
fi

