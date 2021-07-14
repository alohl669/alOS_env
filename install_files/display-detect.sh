#!/bin/bash
desktopMultiplex=$HOME/.config/bspwm/desktop-multiplex.sh
function Cesar () {
	sed -i "s| 1| I|g" $desktopMultiplex
	sed -i "s| 2| II|g" $desktopMultiplex
	sed -i "s| 3| III|g" $desktopMultiplex
	sed -i "s| 4| IV|g" $desktopMultiplex
	sed -i "s| 5| V|g" $desktopMultiplex
	sed -i "s| 6| VI|g" $desktopMultiplex
	sed -i "s| 7| VII|g" $desktopMultiplex
	sed -i "s| 8| VIII|g" $desktopMultiplex
	sed -i "s| 9| IX|g" $desktopMultiplex
	sed -i "s| I0| X|g" $desktopMultiplex
}
if type "xrandr"; then
	echo "#!/bin/sh" > $desktopMultiplex

	j=($(xrandr --query | grep " connected" | cut -d" " -f1))
	#echo "pantallas = ${j[@]}"

	div=${#j[@]}
	#echo "numero de pantallas[Dividendo] = $div"

	ressult=$(( 10 / $div ))
	#echo "Escritorios/pantalla[resultado] = $ressult"
	b=1
	top=$ressult
  	
	#echo ''
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		arr=($(for (( i=$b; i<=$top; i++ )); do echo "$i "; b=$i; done))
		echo "bspc monitor $m -d ${arr[@]}" >> $desktopMultiplex
		b=$(( $top + 1 ))
		top=$(( $top + $ressult ))
  	done
	chmod +x $desktopMultiplex
	Cesar
else
	arr=($(for (( i=1; i<=10; i++ )); do echo "$i "; done))
	echo "#!/bin/sh" > $desktopMultiplex
	echo "bspc monitor -d ${arr[@]}" >> $desktopMultiplex
	chmod +x $desktopMultiplex
	Cesar
fi
