#!/bin/bash
sudo apt-get install -y zsh
cd $HOME/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
zsh
cat>>$HOME/.zshrc<<EOF
alias ll='clear && ls -lah'
alias workspaces='/usr/bin/caja /home/alohl669/code/workspaces'
alias l='clear && ls -lh'
function aurora () {
	cd $HOME/.ssh/
	sudo openvpn --config Aurora-UDP4-1194-alohl669.ovpn --daemon
	cd $HOME
}
function perama () {
	cd $HOME/.ssh/
	sudo openvpn --config ahl.ovpn --daemon
	cd $HOME
}
EOF
# en algun momento hay que instalarlo en root
su
cd $HOME/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
zsh