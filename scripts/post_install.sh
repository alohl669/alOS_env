#!/bin/bash
# post installation script to theming configure
# primero configuramos la terminal, 
# despues descargamos e instlamos la theme de mate que quede bien oscura para acja
# Por ultimo instalamos la theme de rofi
# hay que encontrar el modo de hacer el ejecutable al arranque de la session x
# sudo apt-get install openvpn
# sudo apt-get install net-tools
# sudo apt-get install nmap
systemThemeConfigure () {
    dconf write /org/mate/terminal/profiles/default/font "'Hack Nerd Font Mono 12'"
    dconf write /org/mate/terminal/profiles/default/default-show-menubar false
    dconf write /org/mate/terminal/profiles/default/silent-bell true
    dconf write /org/mate/terminal/profiles/default/allow-bold false
    dconf write /org/mate/terminal/profiles/default/title "'alOS Terminal'"
    dconf write /org/mate/terminal/profiles/default/background-color "'#000000000000'"
    dconf write /org/mate/terminal/profiles/default/foreground-color "'#88888A8A8585'"
    dconf write /org/mate/terminal/profiles/default/use-system-font false
    dconf write /org/mate/terminal/profiles/default/use-theme-colors false
    # dconf write /org/mate/desktop/interface/gtk-theme "'ARK-Dark'"
    # dconf write /org/mate/desktop/interface/gtk-theme "'Ambiant-MATE-Dark'"
    # TODO: buscar un tema compatible o la manera de conseguir ARK-Dark
    # ARK-Dark : Parrot
    # Ambiant-MATE-Dark : Ubuntu mate
    # TODO: Caja rompebspwm
    echo "sxhkd &" > $HOME/.xprofile # o .xinitrc
    echo "exec bspwm" >> $HOME/.xprofile # o .xinitrc
}

. /home/$USER/.alOS/alOS_env/extra/*.sh
installVscode
installBat
installFileManager

systemThemeConfigure