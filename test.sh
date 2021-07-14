#!/bin/bash
uname -v
# Ubuntu 20.04.2 GNOME
# #66~20.04.1-Ubuntu SMP Thu Jun 17 11:14:10 UTC 2021

# Debian 10.2? sin interfaz
# #1 SMP Debian 4.19.160-2 (2020-11-28)

# Rocky-
# #1 SMP Thu Jun 17 07:52:48 UTC 2021

cat /etc/issue
# Ubuntu 20.04.2 GNOME
# Ubuntu 20.04.2 LTS \n \l

# Debian 10.2? sin interfaz
# Debian GNU/Linux 10 \n \l

# Rocky-
# \S
# Kernel \r on an \m

lsb_release -a # parece que funciona en ubuntu y debian, pero no en rocky

# PArece que rocky deberiamos dejar para mas adelante, o directamente olvidarnos de distribuciones basadas en la puta mierda de rhel
# Parece que el metodo mas sencillo de sacar info es mediante /etc/issue, pues debian es poco especifico siempre y no es necesario aplicar demasiados filtros
