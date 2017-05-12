#!/bin/bash
# start ssh
TMUX_SESSION_NAME=main

if [ -z "$SSH_AUTH_SOCK" ] ; then
    echo "Starting SSH Agent"
    eval `ssh-agent -s`
    ssh-add
fi


# attach to tmux
if [[ ! $TERM =~ screen ]]; then
    echo "starting tmux" >> ~/start_log
    if [ -n "TMUX_SESSION_NAME" ]; then
        tmux -2 attach -t $TMUX_SESSION_NAME || tmux -2 new -s $TMUX_SESSION_NAME
    else
        tmux -2 attach || tmux -2
    fi
fi
