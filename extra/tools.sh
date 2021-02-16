function installBat () {
    vpwd=$PWD
    cd /tmp/
    wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
    sudo dpkg -i bat_0.17.1_amd64.deb
    cd $vpwd
}
function installBrave () {
    vpwd=$PWD
    cd /tmp/
    sudo apt install apt-transport-https curl gnupg
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install -y brave-browser
    cd $vpwd
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