#!/bin/bash
# post installation script to theming configure
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
}