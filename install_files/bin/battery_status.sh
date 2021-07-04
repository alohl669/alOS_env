#!/bin/bash
isBattery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep native-path | cut -d ':' -f2)

if [[ $isBatery != "(null)" ]]; then
	percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep percentage | cut -d ':' -f2)
	percentage_INT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep percentage | cut -d ':' -f2 | sed "s|%||g")
	batteryState=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep state | cut -d ':' -f2)
	
	if [[ $batteryState != "discharging" ]]; then
		echo -e "%{F#000000} %{F#000000}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -ge 90 ]]; then
		echo -e "%{F#000000} %{F#000000}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 90 ]]; then
		echo -e "%{F#000000} %{F#000000}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 60 ]]; then
		echo -e "%{F#000000} %{F#000000}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 30 ]]; then
		echo -e "%{F#000000} %{F#000000}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 10 ]]; then
		echo -e "%{F#FF0000} %{F#000000}$percentage%{u-}"
	fi
fi

