#!/bin/bash
InstallBspwm () {
    # Instalamos Bspwm
    echo "Installing bspwm dependencies"
    sudo apt-get install -y libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev
    # clonamos repos e instalamos
    cd /home/$USER/.alOS
    git clone https://github.com/baskerville/bspwm.git
    git clone https://github.com/baskerville/sxhkd.git
    cd /home/$USER/.alOS/bspwm && make && sudo make install
    cd /home/$USER/.alOS/sxhkd && make && sudo make install
    # creamos directorios de cofiguración
    mkdir -p /home/$USER/.config/{bspwm,sxhkd}
    # copiamos ficheros de configuración
    cp /home/$USER/.alOS/alOS_env/install_files/bspwmrc /home/$USER/.config/bspwm/
    cp /home/$USER/.alOS/alOS_env/install_files/sxhkdrc /home/$USER/.config/sxhkd/
    cp /home/$USER/.alOS/alOS_env/install_files/bspwm_resize /home/$USER/.config/bspwm/scripts/
    chmod u+x /home/$USER/.config/bspwm/bspwmrc
    echo "sxhkd &" >> /home/$USER/.xinitrc
    echo "exec bspwm" >> /home/$USER/.xinitrc
    # faltan los SED al usuario en los archivos de configuracion
}

InstallComptonFeh () {
    # instalamos las dependencias que se requieren en los archivos recien copiasos
    echo "Installing more dependencies"
    sudo apt-get install -y compton feh
    mkdir -p /home/$USER/.config/compton
    cp /home/$USER/.alOS/alOS_env/install_files/compton.conf /home/$USER/.config/compton/
}

InstallRofi () {
    sudo apt-get install -y rofi
    echo -n "Let's proceed to give a more beautiful look to rofi, read the instructions carefully and choose the theme that you like, we recommend \"android_notification by Rasi\"[ENTER to contniue]: "
    read nullvar
    rofi-theme-selector
}

InstallDunst () {
    sudo apt-get install -y dunst
}

# if [[ $(id -u) -ne 0 ]]; then
#     # Comprobamos permisos root
#     echo "You need to be a root(or sudo user) to install"
#     exit
# fi

InstallBspwm
InstallComptonFeh
InstallRofi
InstallDunst