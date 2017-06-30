#!/bin/bash
dir=$(pwd)
files=(.bash_profile .bash_history .bash_logout .bashrc)
cd ~/
for f in "${files[@]}"; do 
    rm -f ${f}.OLD
    mv $f ${f}.OLD 2>/dev/null 
done

ln -s $dir/bash/bashrc.sh .bashrc
ln -s $dir/bash/bash_profile.sh .bash_profile
ln -s $dir/bash/bash_logout.sh .bash_logout
ln -s $dir/bash/bash_history .bash_history

