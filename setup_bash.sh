#!/bin/bash
dir=$(pwd)

cd ~/
rm -f .bash_profile .bash_history .bash_logout .bashrc
ln -s $dir/bash/bashrc.sh .bashrc
ln -s $dir/bash/bash_profile.sh .bash_profile
ln -s $dir/bash/bash_logout.sh .bash_logout
ln -s $dir/bash/bash_history .bash_history

