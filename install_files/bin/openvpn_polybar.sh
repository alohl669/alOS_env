#!/bin/bash

echo -e "%{F#CE5C00} %{F#BABDB6}$(/usr/sbin/ifconfig tun0 2>/dev/null | grep 'inet ' | awk '{print $2}')%{u-}"
