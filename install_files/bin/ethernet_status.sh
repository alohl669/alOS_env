#!/bin/bash
ifaceAdapter=($(/usr/sbin/ifconfig -a | grep -v "lo:" | grep RUNNING | cut -d ':' -f1))
ifaceAdapter=${ifaceAdapter[$(expr ${#ifaceAdapter[@]} - 1)]}
if [[ $ifaceAdapter = "e"* ]]; then
	echo -e "%{F#BABDB6} %{F#000000}$(/usr/sbin/ifconfig $ifaceAdapter 2>/dev/null| grep "inet " | awk '{print $2}')%{u-}"
fi
if [[ $ifaceAdapter = "w"* ]]; then
        echo -e "%{F#BABDB6} %{F#000000}$(/usr/sbin/ifconfig $ifaceAdapter 2>/dev/null| grep "inet " | awk '{print $2}')%{u-}"
fi
