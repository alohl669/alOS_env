#!/bin/bash

echo -e "%{F#BABDB6} %{F#000000}$(/usr/sbin/ifconfig ETHIFACE 2>/dev/null| grep "inet " | awk '{print $2}')%{u-}"
