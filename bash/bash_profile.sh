#!/bin/bash
export CONFIG_PATH=/barrett/scratch/donovick/config

# load env
source $CONFIG_PATH/shells/env.sh

# run start up commands
source $CONFIG_PATH/shells/startup.sh

# load bashrc
source $CONFIG_PATH/bash/bashrc.sh

# load aliases
source $CONFIG_PATH/shells/maps.sh

