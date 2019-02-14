#!/bin/bash
function centosInstall(){
    #Download and install bt-panel 6.8
    yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && bash install.sh
}
centosInstall
