#!/bin/bash
function installVscode () {
    cd /tmp/
    wget https://az764295.vo.msecnd.net/stable/ea3859d4ba2f3e577a159bc91e3074c5d85c0523/code_1.52.1-1608136922_amd64.deb
    dpkg -i code_1.52.1-1608136922_amd64.deb
}

