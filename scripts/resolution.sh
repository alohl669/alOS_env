#!/bin/bash
InstallResolution () {
    # En algunas maquinas virtuales o equipos no se establece bien la resolución con bspwm
    # Podemos configurarlo ahora o puedes ejcutar tu mismo el script mas adelante
    #  . /home/$USER/.alOS/alOS_env/scripts/resolution.sh && InstallResolution
    echo "Selecting the monitor resolution..."
    varDisplay=$(xrandr -q | sed -n 2p | cut -d " " -f 1)
    xrandr -q
    echo -n "type your correct display resolution(ie: 1920x1080)[or press ENTER to default 1920x1080]: "
    read resDisplay
    if [[ $resDisplay = '' ]]; then
        resDisplay="1920x1080"
    fi
    sudo echo "#!/bin/sh" > /usr/share/lightdmxrandr.sh
    sudo echo "xrandr --output $varDisplay --primary --mode $resDisplay" >> /usr/share/lightdmxrandr.sh
    sudo chmod +x /usr/share/lightdmxrandr.sh
    sudo echo "display-setup-script=/usr/share/lightdmxrandr.sh" >> /etc/lightdm/lightdm.conf
}