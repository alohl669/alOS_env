#!/bin/bash
SelectDM () {
    n_writeDM=3
    echo -e "\n------------------------------------------------------"
    echo -e "\nSelect from the list the DM that best suits your needs"
    echo -e "\n------------------------------------------------------\n"
    echo -ne "\n1 - gdm3\n2 - sddm\n3 - lightdm\n4 - slim\n5 - lxdm\n[DEFAULT 3]: "
    # read n_writeDM
    case "$n_writeDM" in
        1)
            writeDM="gdm3"
            xRc=".xprofile"
        ;;
        2)
            writeDM="sddm"
            xRc=".xinitrc"
        ;;
        3)
            writeDM="lightdm"
            xRc=".xinitrc"
        ;;
        4)
            writeDM="slim"
            xRc=".xinitrc"
        ;;
        5)
            writeDM="lxdm"
            xRc=".xprofile"
        ;;
        *)
            writeDM="lightdm"
            xRc=".xinitrc"
        ;;
    esac
    
}
InstallBspwm () {
    # Instalamos Bspwm
    echo "Installing bspwm dependencies..."
    sudo apt-get install -y libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev
    # clonamos repos e instalamos
    cd $HOME/.alOS
    git clone https://github.com/baskerville/bspwm.git
    git clone https://github.com/baskerville/sxhkd.git
    cd $HOME/.alOS/bspwm && make && sudo make install
    cd $HOME/.alOS/sxhkd && make && sudo make install
    # creamos directorios de cofiguración
    mkdir -p $HOME/.config/{bspwm,sxhkd}
    # copiamos ficheros de configuración
    sed -i "s|usuario|$USER|g" $HOME/.alOS/alOS_env/install_files/bspwmrc 
    sed -i "s|usuario|$USER|g" $HOME/.alOS/alOS_env/install_files/sxhkdrc
    cp $HOME/.alOS/alOS_env/install_files/bspwmrc $HOME/.config/bspwm/
    cp $HOME/.alOS/alOS_env/install_files/sxhkdrc $HOME/.config/sxhkd/
    mkdir $HOME/.config/bspwm/scripts/
    cp $HOME/.alOS/alOS_env/install_files/bspwm_resize $HOME/.config/bspwm/scripts/
    chmod u+x $HOME/.config/bspwm/bspwmrc
    echo "sxhkd &" >> $HOME/$xRc # .xprofile o .xinitrc
    echo "exec bspwm" >> $HOME/$xRc # .xprofile o .xinitrc
    echo "$HOME/.alOS/alOS_env/scripts/post_install.sh" >> $HOME/.xprofile # o .xinitrc mas adelante en postInstall se elimina esta ultima linea
    # TODO: discernir entre .xinitrc y .xprofile
}

InstallEnviornment () {
    sudo apt-get install -y $writeDM mate-desktop-environment-core dconf-cli
    sudo update-alternatives --install /usr/bin/x-session-manager x-session-manager $(which bspwm) 90
}

InstallComptonFeh () {
    # instalamos las dependencias que se requieren en los archivos recien copiados
    echo "Installing more dependencies..."
    sudo apt-get install -y compton feh
    mkdir -p $HOME/.config/compton
    cp $HOME/.alOS/alOS_env/install_files/compton.conf $HOME/.config/compton/
    cp $HOME/.alOS/alOS_env/install_files/art/* $HOME/.alOS/pictures/
}

# . /home/$USER/.alOS/alOS_env/scripts/resolution.sh

# InstallResolutionMSG () {
#     echo ""
#     echo "--------------------------"
#     echo "    Display Resolution"
#     echo "--------------------------"
#     echo ""
#     echo "In some virtual machines or equipment, the resolution with bspwm is not well established. We can configure it now or you can run the script yourself later if in the end it has not been properly configured"
#     echo ""
#     echo -n "Do you want to set the screen resolution now?[y/N]: "
#     read Answer
#     if [[ $Answer = [Yy] ]]; then
#         InstallResolution
#     else
#         echo ""
#         echo "--------------------------"
#         echo ""
#         echo "Ok, remember that later you can configure the resolution with the following command:"
#         echo ". $HOME/.alOS/alOS_env/scripts/resolution.sh && InstallResolution"
#         echo ""
#         echo -n "[Press ENTER to continue]: "
#         read nullvar
#     fi
# }

InstallRofi () {
    sudo apt-get install -y rofi
    # echo -n "Let's proceed to give a more beautiful look to rofi, read the instructions carefully and choose the theme that you like, we recommend \"android_notification by Rasi\"[ENTER to contniue]: "
    # read nullvar
    echo "rofi.theme: /usr/share/rofi/themes/android_notification.rasi" >> $HOME/.config/rofi/config
    # rofi-theme-selector
}

InstallDunst () {
    sudo apt-get install -y dunst
}

InstallPolybar () {
    # instalamos las dependencias que se requieren
    echo "Installing polybar dependencies..."
    # python3-xcbgen is not compatible with debian 10 stable
    sudo apt-get install -y build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
    sudo apt-get install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
    cd $HOME/.alOS/
    wget https://github.com/polybar/polybar/releases/download/3.4.3/polybar-3.4.3.tar
    tar -xf polybar-3.4.3.tar
    rm polybar-3.4.3.tar

    sudo chown -R root:root polybar
    sudo mv polybar /opt/
    cd /opt/polybar
    sudo mkdir build
    cd /opt/polybar/build
    sudo cmake ..
    sudo make -j$(nproc)
    sudo make install
}

InstallPolybarTheme () {
    # vamos con el theme de la polybar
    cd $HOME/.alOS/alOS_env/install_files/polybar
    mkdir -p $HOME/.local/share/fonts
    cp -r fonts/* $HOME/.local/share/fonts
    fc-cache -v
    # to avoid deletions we will make a backup
    sudo cp /etc/fonts/conf.d/70-no-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.bak
    sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
    mkdir $HOME/.config/polybar
    cp -r * $HOME/.config/polybar
    chmod +x $HOME/.config/polybar/launch.sh
    
    cp -r $HOME/.alOS/alOS_env/install_files/bin $HOME/.config/
    cp -r $HOME/.alOS/alOS_env/install_files/polybar $HOME/.config/
    # SED
    # -- modulo de usuario
    cd $HOME/.config/polybar
    # sed -i "s|usuario|$USER|g" config.ini
    # mv $HOME/.config/bin/usuario.sh $HOME/.config/bin/$USER.sh
    # sed -i "s|usuario|$USER|g" $HOME/.config/bin/$USER.sh
    # ethIface=$(/usr/sbin/ifconfig | sed -n 1p | cut -d ":" -f 1)
    # sed -i "s|ETHIFACE|$ethIface|g" $HOME/.config/bin/ethernet_status.sh

    echo ""
    echo "We have installed our own theme modification for the polybar, if you want to change its appearance you can use the following link"
    echo "https://github.com/adi1090x/polybar-themes"
    echo ""
    echo "Or run the following script later"
    echo ". $HOME/.alOS/alOS_env/scripts/change_polybar.sh && ChangePolybar"
    echo ""
    echo -n "Press ENTER to continue: "
    read nullvar
}

installHackNerdFonts () {
    cd $HOME/.alOS/alOS_env/install_files
    # wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    sudo cp Hack.zip /usr/local/share/fonts/
    cd /usr/local/share/fonts/
    sudo unzip Hack.zip
    sudo rm Hack.zip
}

# Pide sudo
# if [[ $(id -u) -ne 0 ]]; then
#     # Comprobamos permisos root
#     echo "You need to be a root(or sudo user) to install"
#     exit
# fi

SelectDM
InstallBspwm
InstallEnviornment
InstallComptonFeh
# InstallResolution
# InstallResolutionMSG
InstallRofi
InstallDunst
InstallPolybar
InstallPolybarTheme
installHackNerdFonts
sudo reboot
