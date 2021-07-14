ChangePolybar () {
    cd $HOME
    git clone https://github.com/adi1090x/polybar-themes
    echo ""
    echo "------------------------------"
    echo "    Change Polybar Theme"
    echo "------------------------------"
    echo ""
    echo "Welcome to the polybar theme wizard. The themes offered here are property of XXXXX. We only offer a small script that will help you switch between them."
    echo "Below are the available themes"
    echo ""
    ls
    echo ""
    echo "please type the number of the theme you wish to install(ie: 2 or 13)"
    echo -n "[or simply press ENTER to reinstall the default theme]: "
    read nTheme

    if [[ $nTheme -eq [1-13] ]]; then
        cd polybar-themes/polybar-$nTheme
        mkdir -p $HOME/.local/share/fonts
        cp -r fonts/* $HOME/.local/share/fonts
        fc-cache -v
        cp -r * $HOME/.config/polybar
        chmod +x $HOME/.config/polybar/launch.sh
        $HOME/.config/polybar/launch.sh
    else
        cd $ALOS_HOME/install_files/polybar
        cp -r fonts/* $HOME/.local/share/fonts
        fc-cache -v
        cp -r * $HOME/.config/polybar
        chmod +x $HOME/.config/polybar/launch.sh

        cp -r $ALOS_HOME/install_files/bin $HOME/.config/
        cp -r $ALOS_HOME/install_files/polybar $HOME/.config/
        # SED
        # -- modulo de usuario
        cd $HOME/.config/polybar
        sed -i "s|usuario|$USER|g" config.ini
        mv $HOME/.config/bin/usuario.sh $HOME/.config/bin/$USER.sh
        sed -i "s|usuario|$USER|g" $HOME/.config/bin/$USER.sh
        ethIface=$(/usr/sbin/ifconfig | sed -n 1p | cut -d ":" -f 1)
        sed -i "s|ETHIFACE|$ethIface|g" $HOME/.config/bin/ethernet_status.sh
        $HOME/.config/polybar/launch.sh
    fi
    
    
}
