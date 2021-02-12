function installBat () {
    cd /tmp/
    wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
    dpkg -i bat_0.17.1_amd64.deb
}
function installFileManager () {
    # Gestor de archivos(zip, war, rar, tar..)
    sudo apt-get install -y engrampa
}
function installNotepad () {
    # Gestor de archivos(zip, war, rar, tar..)
    sudo apt-get install -y pluma
}
function installFilezilla () {
    # Gestor de archivos(zip, war, rar, tar..)
    sudo apt-get install -y filezilla
}