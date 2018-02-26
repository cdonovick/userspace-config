#!/bin/bash

# PATHS
export CONFIG_PYTHON=$XDG_CONFIG_HOME/python
export PYTHONSTARTUP=$CONFIG_PYTHON/pythonrc.py
export EDITOR="vim"
export PATH=~/.local/bin:$PATH


p="38;2"			#prefix normal
b="1;${p}"			#prefix bold
fi_="${b};238;243;225" #file
di_="${b};140;192;214"
ln_="${b};0;244;254"
pi_="${b};241;148;255"
so_=${pi_}
bd_="${b};168;152;255"
cd_=${bd_}
or_="${b};240;16;16"
ex_="${b};66;211;27"

export LS_COLORS=":fi=${fi_}:di=${di_}:ln=${ln_}:pi=${pi_}:so=${so_}:bd=${bd_}:cd=${cd_}:or=${or_}:ex=${ex_}"

# Local Barrett specific
case "$(hostname)" in
    *barrett*)
		if [ -z ${FAKE_ROOT+x} ]; then
			export FAKE_ROOT=/barrett/scratch/donovick/root
			export PATH=$FAKE_ROOT/src/conda/miniconda3/bin:$FAKE_ROOT/bin:$FAKE_ROOT/games:$PATH
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
