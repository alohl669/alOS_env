#!/bin/bash
cd $HOME  
mkdir -p $HOME/.alOS/pictures
cd $HOME/.alOS
echo -n "You need to install git, some distributions don't have it by default. Do you want to install it?[Y/n]: "
read installGitAnswer
if [[ $installGitAnswer = ['','Y','y'] ]]; then
    sudo apt-get install -y git
else
    echo "ok, bye"
    exit
fi
git clone https://github.com/alohl669/alOS_env.git
cd $HOME/.alOS/alOS_env/scripts/
. install.sh