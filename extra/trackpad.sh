#!/bin/bash
# Trackpad haptic compatibility(Tested on ubuntu 20.04.2)
sudo cat>/usr/share/X11/xorg.conf.d/69-nice.conf<<EOF
Section "InputClass"
    Identifier "touchpad overrides"
    MatchDriver "libinput"
    Option "ClickMethod" "clickfinger"
    Option "DisableWhileTyping" "true"
    Option "MiddleEmulation" "true"
    Option "Tapping" "true"
EndSection
EOF
