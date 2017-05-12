#!/bin/bash

# PATHS
export CONFIG_PYTHON=$CONFIG_PATH/python
export PYTHONSTARTUP=$CONFIG_PYTHON/pythonrc.py
export EDITOR="vim"

# Local Barrett specific
export FAKE_ROOT=/barrett/scratch/donovick/root
export PATH=$FAKE_ROOT/bin:$FAKE_ROOT/games:$PATH
export MANPATH=$FAKE_ROOT/man:$MANPATH

export CPPFLAGS="-I ${FAKE_ROOT}/include ${CPPFLAGS}"
export CFLAGS="-I ${FAKE_ROOT}/include ${CFLAGS}"
export LDFLAGS="-L ${FAKE_ROOT}/lib ${LDFLAGS}"


