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

