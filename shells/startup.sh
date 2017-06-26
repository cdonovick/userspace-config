#!/bin/bash
TMUX_SESSION_NAME=main

# attach to tmux
if [[ ! $TERM =~ screen ]]; then
    if [ -n "$TMUX_SESSION_NAME" ]; then
        tmux -2 attach -t $TMUX_SESSION_NAME || tmux -2 new -s $TMUX_SESSION_NAME
    else
        tmux -2 attach || tmux -2
    fi
fi

# start ssh
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

