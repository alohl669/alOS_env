#!/bin/bash

ALOS_HOME=$HOME/.alOS
ALOS_PATH=$HOME/.alOS/bin #extra se queda colgado por ahora post_install.sh

cd $HOME  
mkdir -p $HOME/.alOS/pictures
cd $ALOS_HOME
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
cp -R $ALOS_HOME/alOS_env/* $ALOS_HOME/
rm -rf $ALOS_HOME/alOS_env
cd $ALOS_PATH
. install.sh
