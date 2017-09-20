#!/bin/bash
#for legacy reasons remove this soon
export CONFIG_PATH=$XDG_CONFIG_HOME

# PATHS
export CONFIG_PYTHON=$XDG_CONFIG_HOME/python
export PYTHONSTARTUP=$CONFIG_PYTHON/pythonrc.py
export EDITOR="vim"

# Local Barrett specific
case "$(hostname)" in
    *barrett*)
		if [ -z ${FAKE_ROOT+x} ]; then
			export FAKE_ROOT=/barrett/scratch/donovick/root
			export PATH=$FAKE_ROOT/bin:$FAKE_ROOT/games:$PATH
			export MANPATH=$FAKE_ROOT/man:$MANPATH

			export CXXFLAGS="-I ${FAKE_ROOT}/include ${CXXFLAGS}"
			export CFLAGS="-I ${FAKE_ROOT}/include ${CFLAGS}"
			export LDFLAGS="-L ${FAKE_ROOT}/lib ${LDFLAGS}"

			export LD_LIBRARY_PATH=${FAKE_ROOT}/lib:$LD_LIBRARY_PATH
		fi
        ;;
    *)
        # default
        ;;
esac

case "$OSTYPE" in
    darwin*)
        export CLICOLOR=1
        ;;
    linux*)
        ;;
    *)
        ;;
esac
