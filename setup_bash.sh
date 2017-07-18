#!/bin/bash
dir=$(pwd)
files=(.bash_profile .bash_logout .bashrc)
cd ~/
for f in "${files[@]}"; do 
    rm -f ${f}.OLD
    mv $f ${f}.OLD 2>/dev/null
	ln -s ${dir}/bash/${f:1}.sh ${f}
done

mv .bash_history ${dir}/bash/bash_history 2>/dev/null
ln -s ${dir}/bash/bash_history .bash_history
