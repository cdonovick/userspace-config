#!/bin/bash
export XDG_CONFIG_HOME=~/userspace-config/

# load env
source $XDG_CONFIG_HOME/shells/env.sh

# run start up commands
source $XDG_CONFIG_HOME/shells/startup.sh

# load bashrc
source $XDG_CONFIG_HOME/bash/bashrc.sh

# load aliases
source $XDG_CONFIG_HOME/shells/maps.sh

