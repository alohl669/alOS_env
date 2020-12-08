#!/bin/bash
cd $HOME  
mkdir -p $HOME/.alOS/pictures
cd $HOME/.alOS
echo -n "You need to install some tools. Do you want to install it?[Y/n]: "
read installGitAnswer
if [[ $installGitAnswer = [Yy] || $installGitAnswer = '' ]]; then
    # install basics
    sudo apt-get install -y build-essential git net-tools zip
    # install xorg
    sudo apt-get install -y xorg
else
    echo "ok, bye"
    exit 1
fi
git clone https://github.com/alohl669/alOS_env.git
cd $HOME/.alOS/alOS_env/scripts/
. install.sh