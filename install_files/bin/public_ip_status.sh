#!/bin/bash
#Usamos una api publica
publicIp=$(curl -s ifconfig.me/ip)
echo -e "%{F#3465a4}  %{F#000000}$publicIp"
