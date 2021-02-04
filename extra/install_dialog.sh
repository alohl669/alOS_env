#!/bin/bash
function instalaDialog () {
    sudo apt-get install dialog -y
}

# function textoDialog () {
#     dialog \
#     --backtitle "config" \
#     --title "archivo fstab" \
#     --textbox /etc/fstab \
#     0 0
# }

function listaHerramientas () {
    listaAplicaciones=(dialog --separate-output --backtitle "config" --checklist "Herramientas" 0 0 0)
    listaOpciones=(
        1 "bat(advanced cat)" on
        2 "engrampa(file manager)" on
        3 "pluma(notepad)" on
        4 "vscode" on)
    listaApps=$("${listaAplicaciones[@]}" "${listaOpciones[@]}" 2>&1 >/dev/tty)

    clear
    
    for seleccion in $listaApps
    do
        case $seleccion in
        1)
        echo "Escogiste la opción 1"
        ;;
        2)
        echo "Escogiste la opción 2"
        ;;
        3)
        echo "Escogiste la opción 3"
        ;;
        4)
        echo "Escogiste la opción 4"
        ;;
        esac
    done
}



# instalaDialog
listaHerramientas
# clear
# echo -e "$listaApps\n"