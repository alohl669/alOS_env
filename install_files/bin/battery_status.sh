#!/bin/bash
isBattery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep native-path | cut -d ':' -f2)

if [[ $isBatery != "(null)" ]]; then
	percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep percentage | cut -d ':' -f2)
	percentage_INT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep percentage | cut -d ':' -f2 | sed "s|%||g")
	batteryState=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *||g" | grep state | cut -d ':' -f2)
	timeToEmpty=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *| |g" | grep "time to empty" | cut -d ':' -f2 | cut -d ' ' -f2,3)
	timeToFull=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | sed "s|  *| |g" | grep "time to full" | cut -d ':' -f2 | cut -d ' ' -f2,3)
	
	if [[ $batteryState != "discharging" ]]; then
		echo -e "%{F#008F39} %{F#141C21}$percentage %{F#2D572C}$timeToFull%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -ge 90 ]]; then
		echo -e "%{F#141C21} %{F#141C21}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 90 ]] && [[ $percentage_INT -gt 60 ]]; then
		echo -e "%{F#141C21} %{F#141C21}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 60 ]] && [[ $percentage_INT -gt 30 ]]; then
		echo -e "%{F#141C21} %{F#141C21}$percentage%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 30 ]] && [[ $percentage_INT -gt 10 ]]; then
		echo -e "%{F#000000} %{F#000000}$percentage %{F#000000}$timeToEmpty%{u-}"
	fi
	if [[ $batteryState = "discharging" ]] && [[ $percentage_INT -lt 10 ]]; then
		echo -e "%{F#AB2A3E} %{F#000000}$percentage %{F#AB2A3E}$timeToEmpty%{u-}"
	fi
fi

