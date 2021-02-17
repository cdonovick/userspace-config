#!/bin/bash
source $XDG_CONFIG_HOME/shells/options.sh


# check if tmux is running
tmux info &> /dev/null
TMUX_INFO=$?

# start ssh
if [ -z "$SSH_AUTH_SOCK" ] && [[ $OPT_START_SSH -ne 0 ]]; then
	eval `ssh-agent -s`
	ssh-add
fi


if [[ $TMUX_INFO -ne 0 ]]  && [[ $OPT_USE_TMUX -ne 0 ]]; then
	echo "launch tmux"
	if [ -n "$OPT_TMUX_SESSION_NAME" ]; then

		# check if session is active
		tmux has-session -t $OPT_TMUX_SESSION_NAME &> /dev/null
		TMUX_HAS_SESSION=$?
		if [[ $TMUX_HAS_SESSION -eq 0 ]]; then
			COMMAND=(-2 attach -t $OPT_TMUX_SESSION_NAME)
		else
			COMMAND=(-2 new -s $OPT_TMUX_SESSION_NAME)
		fi
	else
		tmux list-sessions &> /dev/null
		TMUX_HAS_SESSION=$?
		if [[ $TMUX_HAS_SESSION -eq 0 ]]; then
			COMMAND=(-2 attach)
		else
			COMMAND=(-2 new)
		fi
	fi
	set -x
	tmux "${COMMAND[@]}"
	set +x
fi

